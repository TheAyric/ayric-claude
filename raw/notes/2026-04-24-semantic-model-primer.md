# Semantic Model — Primer Note

_Small test source for the first DataWiki ingest. Date: 2026-04-24. Author: Ayric._

A **semantic model** in Power BI is the logical layer that sits between raw data and report consumers. It defines tables, relationships, and measures — in effect, the shared "business language" that reports query.

Key properties:

- **Tables and relationships** are modeled in a star schema where possible: one fact, many dimensions. Star schemas perform better and are easier to explain than snowflake or flat wide tables.
- **Measures** are calculated using DAX and represent business metrics (Revenue, Active Users, Margin %). They are defined once in the model and reused by every report — this is the main reason a semantic model is worth building versus putting logic in individual reports.
- **Grain** is the level of detail of the fact table — e.g., one row per order line per day. Getting grain right up front is the single most important modeling decision; changing it later is painful.
- **Storage modes** are Import, DirectQuery, and Dual. Import is fastest; DirectQuery is live; Dual lets you mix. Pick Import unless the data is too large or must be real-time.

Common mistakes:

- Building measures inside reports instead of the model — leads to inconsistent numbers across dashboards.
- Modeling at the wrong grain — if the fact table is rolled up, you can't drill back down later.
- Too many bi-directional relationships — makes query plans unpredictable.

Related concepts: star schema, grain, DAX, Direct Query, dimension tables, fact tables.
