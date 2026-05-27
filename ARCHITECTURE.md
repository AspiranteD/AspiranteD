# Production stack architecture

```
                        ┌─────────────────────────────────────────────────────┐
                        │              FastAPI backend (production ERP)        │
  Data sources          │  25+ SQLModel models · ~60 endpoints · APScheduler  │          Outputs
  ─────────────         └──────────────────────┬──────────────────────────────┘          ───────
                                               │
  Wallapop (rev. eng.) ─┐            ┌─────────┴─────────┐            ┌──── Retool ERP
                        ├── Extractors │   PostgreSQL      │◀── Sync ──┤  342 files · 10+ modules
  eBay (OAuth2 + Feed) ─┤   Scrapers   │   40k+ inventory  │   Engine  │
                        │   AI enrich  │   refs · migrations│           ├──── Labels / printer
  Amazon (scraper) ─────┤            └─────────┬─────────┘            │     (local bridge)
  Google Sheets ────────┘                      │
                                      ┌────────┴────────┐
                                      │  Command bridge   │
                                      │  Lock · queue ·   │
                                      │  heartbeat        │
                                      └───────────────────┘
```
