# TMDL (Tabular Model Definition Language)

_A YAML-like text grammar for serializing tabular models at compatibility level 1200+ — the format that makes [[semantic-model|semantic models]] reviewable in git._

## What it is

TMDL serializes a tabular database into a **folder of `.tmdl` files** rather than one monolithic JSON blob. One file per table, role, perspective, and culture, plus root files for the model, relationships, expressions, data sources, and functions. That per-object layout is what makes object-level diffs and merges workable in source control — the thing TMSL (JSON) was bad at.

Every Tabular Object Model (TOM) type and property has a TMDL representation. Two intentional deviations from strict TOM alignment, both for readability:

- **Translations** collapse under culture blocks instead of being scattered per-object.
- **Role members** use shorthand defaults: `user`, `group`, `auto`, `activeDirectory`.

## Why it matters

TMDL is what makes semantic models behave like code: you can review diffs, resolve merge conflicts, and track history per-object. It's the foundation underneath Power BI Desktop projects (PBIP), Fabric workspace sync, and any serious team-based modeling workflow.

MS Learn explicitly calls out providing descriptions on every TOM object as a **best practice** — and TMDL makes that cheap with dedicated syntax (see below).

## Language mechanics

Three load-bearing conventions:

- **Strict whitespace indentation** denotes hierarchy. Indentation is not cosmetic.
- **Colon (`:`)** for property values; **equals (`=`)** for default or expression properties.
- **Single-quote escaping** for object names containing dots, colons, quotes, or whitespace.

### Descriptions

Descriptions are a first-class property with their own syntax: triple-slash (`///`) lines placed **immediately above** the object declaration, with **no whitespace** between the description block and the object token.

```tmdl
/// Revenue recognized at invoice close, net of credits.
measure 'Revenue' = SUM ( Sales[Amount] )
```

### Expressions

Expressions attach via `=` and can be single-line or multi-line. Language depends on the object:

- **[[dax|DAX]]** — measures, calculation items, KPIs, row filters, calculated columns
- **M** — partitions and named expressions
- **XML or JSON** — linguistic metadata

Wrap expressions in triple backticks only when you need to preserve exact whitespace or blank lines. Otherwise, plain indented form is preferred.

### Partial declaration

You can split a single table's measures across multiple `.tmdl` files — useful for large tables where measure files can be grouped by domain. But declaring **the same property twice** (across any combination of files) is a parse error, not a last-write-wins merge.

### The `ref` keyword

More important than it looks. `ref` is how TMDL preserves **deterministic collection ordering** across round-trips, which is what prevents the engine from producing noise diffs when it re-serializes after an edit. Respect it; don't reorder manually.

## API and failure modes

Programmatic round-trips go through `TmdlSerializer`:

- `SerializeDatabaseToFolder` / `DeserializeDatabaseFromFolder` — full folder serialization
- `SerializeObject` — single-object text
- `MetadataSerializationContext` — stream-level control (include/exclude specific documents)

Two exception types, worth distinguishing when Fabric workspace sync or a CI check fails:

- **`TmdlFormatException`** — syntax, indentation, or keyword errors. The file doesn't parse.
- **`TmdlSerializationException`** — valid syntax that violates TOM semantics (e.g., type mismatch, missing required property).

Both carry **document path, line number, and line text**. Those three fields are the starting point for every sync failure diagnosis — read them first before guessing.

## Gotchas worth remembering

- **Description placement is strict.** No whitespace between the `///` block and the object token. If sync errors mention descriptions, this is the likely cause — not a compat-level restriction.
- **Descriptions are not gated by compat level.** They're a language feature available at 1200+, which means 1604 (DirectLake) supports them. Don't blame compat level for description issues.
- **Don't reorder by hand.** Let `ref` and the serializer own ordering. Manual reordering produces noisy diffs that serve no one.
- **Don't duplicate properties across split files.** Partial declaration is allowed; property duplication is not.

## Related

- [[semantic-model]] — what TMDL serializes
- [[dax]] — the expression language for most TMDL measure bodies
- [[concepts/index|Concepts index]]

## Sources

- `raw/references/2026-04-24-tmdl-reference-summary.md`
