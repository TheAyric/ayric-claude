# TMDL Reference Spec — High-Level Summary

Source: Full read of the Microsoft Learn TMDL spec (three pages listed below). Date captured: April 24, 2026

## TMDL at a glance

TMDL is a YAML-like text grammar for tabular models at compatibility level 1200 or higher, with full property parity to the Tabular Object Model. Every TOM object type and property has a TMDL representation, with two optimizations that break strict TOM alignment for readability: Translations collapse under culture blocks, and Role members use shorthand defaults (`user`, `group`, `auto`, `activeDirectory`).

Unlike TMSL's monolithic JSON, TMDL serializes a database into a folder of `.tmdl` files (one per table, role, perspective, culture, plus root files for model, relationships, expressions, data sources, and functions), which is what makes object-level git diffs and merges workable.

The language leans on three conventions:

- Strict whitespace indentation to denote hierarchy
- Colon (`:`) for property values and equals (`=`) for default or expression properties
- Single-quote escaping for object names containing dots, colons, quotes, or whitespace

## Language mechanics that matter day-to-day

Descriptions are a first-class property with dedicated syntax: triple-slash (`///`) lines placed immediately above each object declaration, with no whitespace between the description block and the object token. MS Learn explicitly calls providing descriptions on every TOM object a best practice.

Expressions attach via `=` and can be single-line or multi-line:

- DAX for measures, calculation items, KPIs, row filters, calculated columns
- M for partitions and named expressions
- XML or JSON for linguistic metadata

Wrap expressions in triple backticks only when you need to preserve exact whitespace or blank lines.

Partial declaration is allowed across files (you can split one table's measures into a separate `.tmdl` file), but declaring the same property twice is a parse error.

The `ref` keyword matters more than it looks: it is how TMDL preserves deterministic collection ordering across round-trips, which is what prevents noise diffs in source control when the engine re-serializes.

## API and failure modes

Round-trips go through `TmdlSerializer`:

- `SerializeDatabaseToFolder` and `DeserializeDatabaseFromFolder` for folder serialization
- `SerializeObject` for single-object text
- `MetadataSerializationContext` for stream-level control (include or exclude specific documents)

On failure, TMDL throws two distinct exceptions worth distinguishing:

- `TmdlFormatException` — syntax, indentation, or keyword errors
- `TmdlSerializationException` — valid syntax that violates TOM semantics (e.g., type mismatch)

Both carry the document path, line number, and line text. When Fabric workspace sync fails on a `.tmdl` file, those three fields are the starting point.

## Clarification worth remembering

The spec does not gate descriptions or triple-slash by compatibility level. They are language features available at 1200+, which means 1604 DirectLake supports them. If you hit sync errors tied to descriptions, the more likely cause is the placement rule (no whitespace between the `///` block and the object token) rather than a compat-level restriction.

## Source pages (full-read)

1. Tabular Model Definition Language (TMDL) overview
2. Get started with TMDL
3. TMDL Reference - Objects overview

Supplementary (not part of the spec, but relevant for day-to-day work):

- Use TMDL view in Power BI Desktop
- Power BI Desktop project semantic model folder
- Power BI Desktop projects (PBIP) overview
