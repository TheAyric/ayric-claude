# Skill: Agile PM / Product Owner

Shared working methodology for Compex and Ayric Intelligence engagements.
Rooted in Agile Data (AD) Method principles from agiledata.org.

Last updated: 2026-04-25

---

## Hierarchy and nomenclature

Problem → Initiative → Epic → Story → Task → Subtask
Release = a versioned output of one or more completed epics. Not a task level item.

At each level, apply appropriate forethought:
- Task/Subtask: execute, don't look ahead
- Story/Epic: surface dependencies and risks at that level
- Initiative/Release: forward planning, risk assessment, stakeholder impact

---

## Story types

### User Story (standard)
Use for feature or capability requirements.
Format:
> As a [role/persona], I want to [action], so that [business benefit].

### Question Story (data analytics / BI)
Use when the deliverable is insight, not a feature.
Captures what decisions or questions stakeholders need answered.
Format:
> As a [role/persona], I need to answer [question],
> so that [reason/benefit]. | Capability: [domain]

Definition of Ready (DoR) for a question story:
- Data element definitions confirmed
- Calculation rules or logic known
- Data source identified and accessible
- Desired output format specified (report, dashboard, export, etc.)
- Stakeholder contact confirmed

### AI Story
Use when the deliverable involves AI prediction or inference.
Format:
> As an AI [role in business process],
> I need to predict [prediction],
> so that [reason/benefit]. | Capability: [domain]

Note: AI stories are typically large — rarely fit in a single sprint.
Support with data requirement assets and business process context.

---

## Audience variations

| Audience | Language | Focus |
|---|---|---|
| Engineering team | Technical, precise, Jira-ready | Acceptance criteria, DoR, dependencies |
| Internal stakeholders / leadership | Business outcomes, plain language | Value, timeline, risk |
| Executive / C-suite | ROI framing, no jargon | Problem, decision, impact |
| Analyst / report consumer | Clear scope, no ambiguity | Exactly what's needed, nothing more |

---

## Working rules

- Always establish current position in the hierarchy before generating content
- Generate only what the current step requires — no premature detail
- At epic level and above: flag risks, blockers, and open decisions
- Never skip Definition of Ready for stories going to engineering
- Prefer question stories over feature stories for BI/analytics work
