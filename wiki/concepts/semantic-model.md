# Semantic Model

_The logical layer in Power BI that sits between raw data and report consumers, defining shared tables, relationships, and measures._

## What it means

A semantic model is the "business language" layer that reports query. Instead of every report writing its own SQL against raw tables, the semantic model defines:

- **Tables and relationships** — typically modeled as a [[star-schema|star schema]] (one fact, many dimensions). Star schemas perform better and are easier to explain than snowflake or wide flat tables.
- **Measures** — business metrics (Revenue, Active Users, Margin %) expressed in [[dax|DAX]] and defined once, then reused by every report that consumes the model.
- **Grain** — the level of detail of the fact table (e.g., one row per order line per day). See [[grain]].
- **Storage mode** — Import, [[direct-query|DirectQuery]], or Dual. Import is fastest; DirectQuery is live; Dual mixes them. Default to Import unless the data is too large or must be real-time.

## Why it matters

The reason to build a semantic model (versus putting logic in individual reports) is **consistency**. When measures live in the model, every dashboard that uses the model gets the same numbers. When measures live in reports, each report drifts, and the same metric name produces different results in different dashboards.

Downstream consumers (Power BI reports, Excel via Analyze-in-Excel, paginated reports, external tools) all share the model's definitions — so getting the model right is the single highest-leverage modeling activity.

## Common confusions

- **Semantic model vs. dataset** — historically called "datasets" in Power BI; Microsoft renamed to "semantic model" in 2023. Same thing.
- **Semantic model vs. [[lakehouse|lakehouse]]/warehouse** — the lakehouse/warehouse holds the raw rows; the semantic model is a thin logical layer that queries them (DirectQuery) or caches a compressed copy (Import).
- **Measures vs. calculated columns** — measures are evaluated at query time against the filter context; calculated columns are computed at refresh and stored. Measures compose; columns don't.

## Common mistakes

- **Defining measures inside reports** instead of in the model — leads to inconsistent numbers across dashboards. Fix by promoting measures into the model.
- **Wrong grain** — if the fact table is pre-aggregated, you can't drill back down later. Decide grain before loading data; changing it after is painful.
- **Too many bi-directional relationships** — makes query plans unpredictable and can cause ambiguity errors. Use single-direction filtering by default; add bi-di only with a specific reason.

## Related

- [[star-schema]]
- [[grain]]
- [[dax]]
- [[direct-query]]
- [[tmdl]] — text format for authoring semantic models under source control
- [[concepts/index|Concepts index]]

## Sources

- `raw/notes/2026-04-24-semantic-model-primer.md`
