# Grain

_The level of detail a fact table represents — what one row means._

## What it means

Grain answers the question "what does one row in this fact table mean?" in a single sentence. If you can't state it in one sentence, the grain is probably wrong.

Common grains in Power BI / Fabric work:

- **Transaction grain** — one row per order line, per invoice line, per event. Most flexible; coarser aggregates roll up easily from it.
- **Daily snapshot grain** — one row per entity per day (inventory levels, account balances). Needed for point-in-time questions that transactions alone can't answer.
- **Accumulating snapshot grain** — one row per pipeline record, updated as it moves through stages (loan applications, support tickets). Rare but powerful when the business cares about lifecycle timing.

## Why it matters

Grain is the single most important modeling decision in a [[semantic-model|semantic model]], because changing it after the fact is expensive and often requires reloading history. It directly drives:

- **Measure correctness** — [[dax|DAX]] patterns assume a specific grain. A measure that's correct at transaction grain may double-count at daily snapshot grain.
- **Storage mode viability** — transaction grain over many years may force [[direct-query|DirectQuery]] because the Import table won't fit in memory.
- **Relationship design** — bi-directional filtering becomes dangerous at mixed grains and can produce silently wrong numbers.

### Rules of thumb

- **Go as low as the business question requires, and no lower.** Finer grain means bigger tables and slower queries; coarser grain means you can't drill down later.
- **Match grain across joined facts.** If two fact tables have different grains, aggregate one up to match the other before joining rather than relying on relationships to sort it out.
- **Document the grain in plain English at the top of the dataset page** — "one row per X per Y". If that sentence doesn't come easily, revisit the model.

## Common confusions

- **Grain vs. granularity of a dimension** — grain describes the fact table; dimensional granularity describes how finely a dimension slices it (e.g., date dim at day vs. month). Different things.
- **Source grain vs. model grain** — the source may produce fine-grained transactions, but the model can aggregate up to daily snapshots before loading. You can aggregate up; you cannot drill back down.
- **Business grain vs. key uniqueness** — "one row per order line" is the business grain; whether `(order_id, line_id)` is a unique key is the physical expression of it. The two should agree — if they don't, either the grain statement or the loading logic is wrong.

## Related

- [[semantic-model]]
- [[star-schema]]
- [[dax]]
- [[direct-query]]
- [[concepts/index|Concepts index]]

## Sources

- `raw/notes/2026-04-24-grain-primer.md`
