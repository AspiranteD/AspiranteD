# Guillem Climent

**Technical Founder | Production Systems Architect** | Valencia, Spain

### I build production systems for real operations

Founder-led systems handling **thousands of SKUs**, multi-marketplace workflows, order processing, catalog enrichment, and warehouse execution in production.

Rebuilt warehouse and inventory operations after disaster-related infrastructure loss.

Everything in this profile is **production code** extracted from real operations. No tutorials, no demos.

[Portfolio](https://aspiranted.github.io) | [LinkedIn](https://linkedin.com/in/gcliment) | [Case study](https://aspiranted.github.io/blog/reusalia-full-system.html) | [guillemclim@gmail.com](mailto:guillemclim@gmail.com)

---

### Selected impact

| Area | What was built |
|------|----------------|
| **Production ERP** | 10+ modules, 342 frontend files, 25+ DB models, ~60 API endpoints - used daily by a **5-person** operation |
| **Inventory and database** | PostgreSQL backbone managing **40,000+** unique inventory references and operational records |
| **Marketplace extraction and sync** | **12** Wallapop accounts + eBay - custom extraction and near-real-time sync into PostgreSQL |

---

### What I build

- **Ops platforms** - ERP, inventory, pricing, order workflows, warehouse execution
- **Data pipes** - synchronization, reconciliation, validation, migration, reporting
- **Applied AI** - LLM-assisted catalog enrichment and product standardization at scale
- **Marketplaces** - reverse-engineered private APIs and multi-account extraction workflows
- **Cloud / local** - cloud workflows connected to on-prem hardware without inbound network exposure

---

### Architecture (production stack)

**Flow:** Wallapop (reverse-engineered) + eBay (OAuth2/Feed) + Amazon scraper + Google Sheets  
→ extractors / scrapers / AI enrichment  
→ **PostgreSQL** (40k+ inventory refs, migrations)  
→ sync engine  
→ Retool ERP (342 files, 10+ modules) + label printer via **command bridge** (lock, queue, heartbeat)

Detailed diagram: [ARCHITECTURE.md](ARCHITECTURE.md)

---

### Open-source modules (this GitHub)

#### Core platform

| Repo | Maps to CV | Stack |
|------|------------|-------|
| [inventory-ops-api](https://github.com/AspiranteD/inventory-ops-api) | Inventory domain: items, orders, sales, incidents, listings | Python, SQLModel patterns |
| [retool-erp-modules](https://github.com/AspiranteD/retool-erp-modules) | Internal ERP tooling: SQL/JS validation, sync comparator | SQL, JavaScript, Retool |
| [cloud-local-command-bridge](https://github.com/AspiranteD/cloud-local-command-bridge) | Cloud to local: distributed lock, command queue, printer discovery | Python, distributed systems |

#### Marketplaces

| Repo | Maps to CV | Stack |
|------|------------|-------|
| [wallapop-data-extractors](https://github.com/AspiranteD/wallapop-data-extractors) | Reverse-engineered API, 12-account workflows | Python, Requests |
| [marketplace-auth-manager](https://github.com/AspiranteD/marketplace-auth-manager) | Multi-account cookie auth, JWT expiry, session refresh | Python, JWT |
| [amazon-product-scraper](https://github.com/AspiranteD/amazon-product-scraper) | Catalog ingestion: idempotent writes, priority queue | Python, BeautifulSoup |
| [ebay-automation-toolkit](https://github.com/AspiranteD/ebay-automation-toolkit) | eBay OAuth2, Feed API, orders, shipping, CSV feeds | Python, eBay API |
| [marketplace-sync-engine](https://github.com/AspiranteD/marketplace-sync-engine) | Near-real-time sync: scheduler, watchdog, feed pipeline | Python, APScheduler |

#### Data and AI

| Repo | Maps to CV | Stack |
|------|------------|-------|
| [ai-product-enrichment](https://github.com/AspiranteD/ai-product-enrichment) | LLM catalog enrichment, categorization, descriptions | Python, OpenAI |
| [sheets-to-postgres-migration](https://github.com/AspiranteD/sheets-to-postgres-migration) | Sheets to PostgreSQL ETL: validation, FK resolution | Python, PostgreSQL |
| [product-image-pipeline](https://github.com/AspiranteD/product-image-pipeline) | Warehouse ops: photos, thermal labels, barcodes | Python, Pillow |

---

### Technical scope

```
Backend:     Python (FastAPI), Java (Spring Boot), SQLModel
Data:        PostgreSQL, MySQL, OracleSQL, ETL
Automation:  Web extraction, Selenium, browser/network analysis
AI:          OpenAI GPT workflows, enrichment pipelines
Infra:       Docker, Jenkins, OpenShift, Git, CI/CD
```

---

### Background

**Founder - REUSALIA** (Apr 2023 - Present): Physical e-commerce with a custom production stack.

**Engineering:** LittleBig Connection, Sopra Steria (AIRBUS), Capgemini (Mercadona).

**Education:** B.Eng. Multimedia Engineering, Universitat de Valencia.

---

### Operating principle

> I design systems with one practical objective: make operations more efficient, more controllable, and less dependent on manual work. Technical decisions map to business outcomes.
