# Gold Layer Design for DAX and UDF Optimization

**Date:** March 30, 2026  
**Chat URL:** https://claude.ai/chat/b7fb7403-5841-4012-9df0-c72dc0846353  
**Mode:** Fabric Learning  

---

## Summary

Deep architectural conversation about the gold layer design in Ayric's Microsoft Fabric medallion lakehouse. Used the `gold_core_exe1_c` notebook as a case study to surface a fundamental design tension between Ayric's approach and engineer Alex's current implementation.

## Core Tension

| Approach | Owner | Pattern |
|----------|-------|---------|
| **Current** | Alex | Highly specific pre-aggregated materialized tables in gold layer, business rules hardcoded in PySpark notebook CTEs |
| **Proposed** | Ayric | Thin gold layer + thick semantic model — dimensions handle classification, DAX handles aggregation |

## Key Findings

### EXE1 Notebook Analysis (`gold_core_exe1_c`)
- Unions **four different grains**: Order Bill, Order Bill Line Item, Order Bill Quantity, and Court Reporting Jobs
- Business rules hardcoded inline rather than managed through a dimension table
- TruSummary counts **pages** rather than records — may or may not be intentional

### Existing Precedent
- On-premises source table `DB03.dataanalytics.core.activitiesattributes` already demonstrates the **dimension-driven classification pattern** Ayric wants to adopt
- Useful precedent for alignment conversations — grounding the argument in what already exists rather than abstract principles

### What EXE1 Executive Summary Actually Measures
- **Total billable record units by category per business day**
- NOT order counts or order location counts
- TruSummary page-vs-record distinction needs stakeholder confirmation

## Root Cause Identified

Mixed requirements flowing separately to Ayric and Alex are contributing to architectural confusion and undocumented notebook code that obscures what business rules are being applied.

## Deliverables Produced

1. **Alignment one-pager** — written summary for stakeholder conversations
2. **Infographic** — visual aid for the same conversations

### Conversation Sequence Planned
1. **First with Alex** — confirm business logic interpretation in the notebook
2. **Then with stakeholders** — confirm definition of "Total Records" and gross amount

## Ayric's Position

Business logic belongs in DAX measures and dimension tables for:
- **Transparency** — stakeholders and power users can see, understand, and eventually maintain metrics
- **Scalability** — consistent enterprise-wide metric definitions
- **Self-service analytics** — democratizing data access

## Status

✅ **Analysis complete.** One-pager and infographic produced. Awaiting alignment conversations with Alex and stakeholders.

## Open Items

- [ ] Meet with Alex to confirm business logic interpretation
- [ ] Meet with stakeholders to confirm "Total Records" definition and gross amount
- [ ] Resolve TruSummary pages-vs-records question
- [ ] Address requirement flow process to prevent future architectural drift
