# Grain — Primer Note

_Second test source for the DataWiki ingest. Date: 2026-04-24. Author: Ayric._

**Grain** is the level of detail a fact table represents — what one row means. It is the single most important modeling decision in a semantic model, because changing it after the fact is expensive and often requires reloading history.

Common grains in Power BI / Fabric work:

- **Transaction grain** — one row per order line, per invoice line, per event. Most flexible; aggregates roll up easily.
- **Daily snapshot grain** — one row per entity per day (inventory levels, account balances). Needed for point-in-time questions.
- **Accumulating snapshot grain** — one row per pipeline record, updated as it progresses through stages (loan applications, support tickets). Rare but powerful.

Rules of thumb:

- **Go as low as the business question requires, and no lower.** Finer grain means bigger tables and slower queries; coarser grain means you can't drill down later.
- **Match grain across joined facts.** If two fact tables have different grains, aggregating one to match the other before joining is usually safer than using relationships.
- **Document the grain in plain English at the top of the dataset page.** "One row per X per Y" — if you can't state it in one sentence, the grain is probably wrong.

Grain directly drives:

- Measure correctness — DAX patterns assume a specific grain
- Storage mode viability — transaction grain over many years may force DirectQuery
- Relationship design — bi-directional filtering becomes dangerous at mixed grains

Related concepts: semantic model, star schema, fact table, measure, DirectQuery.
