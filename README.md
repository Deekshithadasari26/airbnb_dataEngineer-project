# End-to-End Data Engineering Pipeline: DBT + Snowflake + AWS S3

## Overview
A production-grade, end-to-end data engineering pipeline built using AWS S3 as a data lake,
Snowflake as a cloud data warehouse, and DBT Core for modular SQL transformations —
Following Medallion Architecture principles across Bronze, Silver, and Gold layers.

---

## Architecture
## Tech Stack
- **AWS S3** — Cloud object storage/data lake
- **Snowflake** — Cloud data warehouse
- **DBT Core (CLI)** — ELT transformations, testing, snapshots
- **Jinja Templating** — Dynamic, metadata-driven SQL generation
- **Git & GitHub** — Version control
- **Python (venv)** — DBT environment setup
- **VS Code** — Development IDE with DBT extensions

---

## Key Features

### Medallion Architecture
- Bronze layer stores raw, unprocessed data ingested from S3 via Snowflake external stages
- Silver layer applies cleansing, type casting, and incremental transformation logic
- Gold layer exposes a star schema (fact + dimension tables) for downstream analytics

### Incremental Loading
- Implemented DBT incremental materialization with `is_incremental()` macro
- Dynamic max-date filtering with safe fallback defaults for initial loads
- Efficiently processes only new/changed records on each pipeline run

### SCD Type 2 with DBT Snapshots
- Tracks historical changes in dimension data using DBT's snapshot feature
- Automated versioning with `updated_at` timestamps and surrogate key management

### Metadata-Driven Pipeline
- Dynamic SQL generation using Jinja macros and YAML/JSON configs
- Table joins, column aliases, and conditions driven by metadata — zero hardcoded SQL
- One Big Table (OBT) pattern before star schema decomposition

### Dimensional Modeling
- Gold layer star schema separating fact tables (transactional metrics) from
  dimension tables (contextual descriptors)
- Proper key mapping for BI tool compatibility

### Data Quality Testing
- DBT singular tests enforcing business rules (e.g., non-negative amounts)
- Severity configuration (error vs. warning) for controlled pipeline behavior

---
