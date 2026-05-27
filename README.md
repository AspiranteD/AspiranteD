# Guillem Climent

**Technical Founder & Engineer** · Valencia, Spain

I built a full production platform that runs a physical e-commerce business — ~100 orders/day, 12 marketplace accounts, 6 employees, 3 marketplaces synced. One engineer. 180+ Python scripts.

### The System

```
Wallapop (rev. eng.) ──┐                                    ┌── Retool ERP (342 files)
eBay (OAuth2 + Feed) ──┤── FastAPI ── PostgreSQL (25+ models) ──┤── Multi-marketplace Sync
Amazon (scraper + AI) ──┤      ↑           ↑                ├── AI Enrichment (GPT-4)
Google Drive ───────────┘   APScheduler  Alembic (35+ migr.)└── Label Printer (USB bridge)
```

### Key Projects

| Project | What It Does | Impact |
|---|---|---|
| [**Inventory Operations API**](https://github.com/AspiranteD/inventory-ops-api) | Full REST API — items, orders, invoicing, scheduler | Used daily by 6 employees |
| [**Wallapop Extractors**](https://github.com/AspiranteD/wallapop-data-extractors) | Reverse-engineered private API, multi-account | Replaces ~5h/day manual work |
| [**AI Product Enrichment**](https://github.com/AspiranteD/ai-product-enrichment) | Amazon scraping → GPT-4 → auto-listings | Saves ~40h/week |
| [**Cloud-Local Bridge**](https://github.com/AspiranteD/cloud-local-command-bridge) | DB command queue with lock/heartbeat/failover | Connects cloud UI to hardware |

### Background

Founded REUSALIA at 25. Before that: Sopra Steria (AIRBUS), Capgemini (Mercadona), LittleBig Connection.  
B.Eng. Multimedia Engineering — Universitat de València.

**[Portfolio](https://aspiranted.github.io)** · **[LinkedIn](https://linkedin.com/in/gcliment)** · **[guillemclim@gmail.com](mailto:guillemclim@gmail.com)**
