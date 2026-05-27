# Guillem Climent

**Technical Founder · Production Systems Architect** · Valencia, Spain

### I build production systems for real operations

Founder-led systems handling **thousands of SKUs**, multi-marketplace workflows, order processing, catalog enrichment, and warehouse execution — all in production.

Rebuilt warehouse and inventory operations after disaster-related infrastructure loss.

Everything in this profile is **production code** extracted from real operations. No tutorials, no demos.

[**Portfolio**](https://aspiranted.github.io) · [**LinkedIn**](https://linkedin.com/in/gcliment) · [**Case study**](https://aspiranted.github.io/blog/reusalia-full-system.html) · [**guillemclim@gmail.com**](mailto:guillemclim@gmail.com)

---

### Selected impact

| Area | What was built |
|---|---|
| **Production ERP** | 10+ modules, 342 frontend files, 25+ DB models, ~60 API endpoints — used daily by a **5-person** operation |
| **Inventory & database** | PostgreSQL backbone managing **40,000+** unique inventory references and operational records |
| **Marketplace extraction & sync** | **12** Wallapop accounts + eBay — custom extraction and near-real-time sync into PostgreSQL |

---

### What I build

- **Ops platforms** — ERP, inventory, pricing, order workflows, warehouse execution  
- **Data pipes** — synchronization, reconciliation, validation, migration, reporting  
- **Applied AI** — LLM-assisted catalog enrichment and product standardization at scale  
- **Marketplaces** — reverse-engineered private APIs and multi-account extraction workflows  
- **Cloud / local** — cloud workflows connected to on-prem hardware without inbound network exposure  

---

### Architecture (production stack)

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

---

### Open-source modules (this GitHub)

#### Core platform
| Repo | Maps to CV | Stack |
|---|---|---|
| [**inventory-ops-api**](https://github.com/AspiranteD/inventory-ops-api) | Inventory domain: items, orders, sales, incidents, listings — business rules and side effects | Python · SQLModel patterns |
| [**retool-erp-modules**](https://github.com/AspiranteD/retool-erp-modules) | Internal ERP tooling: SQL/JS deploy validation, sync comparator, order state patterns | SQL · JavaScript · Retool |
| [**cloud-local-command-bridge**](https://github.com/AspiranteD/cloud-local-command-bridge) | Cloud ↔ local: distributed lock, command queue, printer discovery (no inbound exposure) | Python · Distributed systems |

#### Marketplaces
| Repo | Maps to CV | Stack |
|---|---|---|
| [**wallapop-data-extractors**](https://github.com/AspiranteD/wallapop-data-extractors) | Reverse-engineered private API — orders, chats, listings, 12-account workflows | Python · Requests |
| [**marketplace-auth-manager**](https://github.com/AspiranteD/marketplace-auth-manager) | Multi-account cookie auth, JWT expiry, automatic session refresh | Python · JWT |
| [**amazon-product-scraper**](https://github.com/AspiranteD/amazon-product-scraper) | Catalog ingestion: idempotent writes, priority queue, resilient scraping | Python · BeautifulSoup |
| [**ebay-automation-toolkit**](https://github.com/AspiranteD/ebay-automation-toolkit) | eBay OAuth2, Feed API, orders, shipping, CSV feeds | Python · eBay API |
| [**marketplace-sync-engine**](https://github.com/AspiranteD/marketplace-sync-engine) | Near-real-time sync: scheduler, watchdog, feed pipeline, ASIN dedup | Python · APScheduler |

#### Data & AI
| Repo | Maps to CV | Stack |
|---|---|---|
| [**ai-product-enrichment**](https://github.com/AspiranteD/ai-product-enrichment) | LLM catalog enrichment, categorization, policy-aware descriptions | Python · OpenAI |
| [**sheets-to-postgres-migration**](https://github.com/AspiranteD/sheets-to-postgres-migration) | Sheets → PostgreSQL ETL: validation, FK resolution, phased reports | Python · PostgreSQL |
| [**product-image-pipeline**](https://github.com/AspiranteD/product-image-pipeline) | Warehouse ops: photo validation, thermal labels, barcodes, carrier PDFs | Python · Pillow |

---

### Technical scope

```
Backend:     Python (FastAPI) · Java (Spring Boot) · SQLModel
Data:        PostgreSQL · MySQL · OracleSQL · ETL
Automation:  Web extraction · Selenium · browser/network analysis
AI:          OpenAI GPT workflows · enrichment pipelines
Infra:       Docker · Jenkins · OpenShift · Git · CI/CD
```

---

### Background

**Founder — REUSALIA** (Apr 2023 – Feb 2024): Founded and scaled physical e-commerce with a custom production stack (inventory, pricing, listings, orders, warehouse).

**Engineering:** LittleBig Connection · Sopra Steria (AIRBUS) · Capgemini (Mercadona).

**Education:** B.Eng. Multimedia Engineering — Universitat de València.

---

### Operating principle

> I design systems with one practical objective: make operations more efficient, more controllable, and less dependent on manual work. Technical decisions map to business outcomes — engineering depth with founder-level accountability.
