# Guillem Climent

**Technical Founder & Engineer** · Valencia, Spain

I design, build, and operate production systems. I founded a physical e-commerce company and built its entire tech stack from scratch — one engineer, 180+ Python scripts, processing ~100 orders/day across 12 marketplace accounts.

Everything in my repos is production code. No tutorials, no demos.

---

### Architecture

```
                        ┌─────────────────────────────────────────────────────┐
                        │                    FastAPI Backend                  │
  Data Sources          │  25+ SQLModel models · ~60 endpoints · APScheduler │          Outputs
  ─────────────         └──────────────────────┬──────────────────────────────┘          ───────
                                               │
  Wallapop API ────┐                  ┌────────┴────────┐                  ┌──── Retool ERP
  (reverse-eng.)   │                  │   PostgreSQL     │                  │     342 files
                   ├── Extractors ───▶│   NeonDB Cloud   │◀── Sync ────────┤     10+ modules
  eBay API ────────┤   Scrapers       │   35+ migrations │    Engine       │
  (OAuth2 + Feed)  │   AI Pipeline    │   Views/Triggers │                 ├──── Label Printer
                   │                  └────────┬────────┘                  │     Brother QL-700
  Amazon.es ───────┤                           │                           │     (USB via bridge)
  (scraper)        │                  ┌────────┴────────┐                  │
                   │                  │  Command Bridge  │                  └──── CSV/Drive
  Google Drive ────┘                  │  Exclusive lock  │                        Feeds
                                      │  Heartbeat ~60s  │
                                      │  Auto-failover   │
                                      └─────────────────┘
```

---

### Repos

#### Core Platform
| Repo | Description | Stack |
|---|---|---|
| [**inventory-ops-api**](https://github.com/AspiranteD/inventory-ops-api) | Production REST API: items, orders, invoicing, scheduler, cookie mgmt, label printing. The backbone. | FastAPI · SQLModel · PostgreSQL · APScheduler |
| [**retool-erp-modules**](https://github.com/AspiranteD/retool-erp-modules) | Internal ERP: 342 files, 10+ modules — orders, inventory, invoicing, incidents, chat analytics, mobile scanner. | SQL · JavaScript · Retool |
| [**cloud-local-command-bridge**](https://github.com/AspiranteD/cloud-local-command-bridge) | Database command queue pattern: cloud UI → exclusive lock → heartbeat → local hardware. ~60s failover. | FastAPI · PostgreSQL · Distributed Systems |

#### Reverse Engineering & Extraction
| Repo | Description | Stack |
|---|---|---|
| [**wallapop-data-extractors**](https://github.com/AspiranteD/wallapop-data-extractors) | Reverse-engineered private API. Cookie auth, anti-detection, parallel multi-account extraction. 2,100+ lines, 5 major versions. | Python · Threading · Requests |
| [**marketplace-auth-manager**](https://github.com/AspiranteD/marketplace-auth-manager) | Multi-account auth lifecycle: cookie/bearer management, JWT decoding, automatic token refresh across 12+ accounts. | Python · JWT · PostgreSQL |
| [**amazon-product-scraper**](https://github.com/AspiranteD/amazon-product-scraper) | Production scraper: titles, prices, hi-res images, features. UA rotation + request throttling. | Python · BeautifulSoup |

#### AI & Data Pipelines
| Repo | Description | Stack |
|---|---|---|
| [**ai-product-enrichment**](https://github.com/AspiranteD/ai-product-enrichment) | Amazon scraping → GPT-4 categorization → description generation → marketplace sync. Autonomous. | Python · OpenAI · FastAPI |
| [**sheets-to-postgres-migration**](https://github.com/AspiranteD/sheets-to-postgres-migration) | 5-phase migration pipeline: extract → validate → migrate → sync → verify. 3 years of data, zero downtime. | Python · gspread · PostgreSQL |
| [**product-image-pipeline**](https://github.com/AspiranteD/product-image-pipeline) | Anti-duplicate image transforms (OpenCV), resize, compress, upload. Bypasses marketplace filters. | Python · OpenCV · PIL |

#### Marketplace Integration
| Repo | Description | Stack |
|---|---|---|
| [**ebay-automation-toolkit**](https://github.com/AspiranteD/ebay-automation-toolkit) | End-to-end eBay: OAuth2 auth, Feed API batch uploads (1,000+ items), order import, shipping with tracking. | Python · eBay API · OAuth2 |
| [**marketplace-sync-engine**](https://github.com/AspiranteD/marketplace-sync-engine) | Single source of truth → Wallapop + eBay + PortalHero. Marketplace-specific formatting. | Python · FastAPI · PostgreSQL |

---

### Production Metrics

```
Orders processed/day ·····  ~100+        Active accounts ··········  12
Team using ERP daily ·····  6            Marketplaces synced ·······  3
Manual work replaced ·····  ~5h/day      AI descriptions saved ·····  ~40h/week
DB models ·················  25+         DB migrations ·············  35+
Python scripts ············  180+        Retool files ··············  342
```

---

### Stack

```
Python · FastAPI · SQLModel · PostgreSQL · OpenAI GPT-4 · BeautifulSoup · Selenium
Java · Spring Boot · Angular · Vue.js · Docker · Jenkins · OpenShift
eBay API (OAuth2) · Wallapop API (rev. eng.) · Google Drive · Retool · Brother QL-700
```

---

### Background

Founded REUSALIA at 25 — physical e-commerce powered by custom automation.
Before that: **Sopra Steria** (AIRBUS) · **Capgemini** (Mercadona) · **LittleBig Connection**.
B.Eng. Multimedia Engineering — Universitat de València.

[**Portfolio**](https://aspiranted.github.io) · [**LinkedIn**](https://linkedin.com/in/gcliment) · [**Case Study**](https://aspiranted.github.io/blog/reusalia-full-system.html) · [**guillemclim@gmail.com**](mailto:guillemclim@gmail.com)
