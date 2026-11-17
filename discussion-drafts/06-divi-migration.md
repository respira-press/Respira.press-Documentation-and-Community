---
title: "Divi 4 to Divi 5: migration copilot prompts (not auto-conversion)"
category: "Ideas"
---

Respira does not claim to auto-convert your Divi 4 layouts into Divi 5. Divi migration is a Divi-owned conversion process.

What Respira can do:

- pre-migration audit prompts
- compatibility warnings interpretation
- post-migration checks and cleanup prompts
- duplicate-first safe workflow

## Prompt recipes (generic, safe)

### 1) Audit third party modules and shortcodes

```
List all et_pb_* shortcodes and third-party Divi modules on my site.
For each page, report: module type, page ID, and whether it's a Divi core or custom module.
Do not modify anything.
```

### 2) Pre-migration checklist generator

```
Based on the Divi 5 readiness report for my site, create a pre-migration checklist.
Include: high-risk pages, legacy module counts, recommended staging order.
Output as a numbered checklist I can follow.
```

### 3) Post-migration verification checklist

```
Create a post-migration verification checklist for my Divi 5 site.
Include: layout sanity check, responsive breakpoints, performance baseline, module output validation.
Format as actionable steps.
```

Docs:

- [Divi 4 to Divi 5 Migration Guide](https://www.respira.press/docs/guides/divi-4-to-divi-5)
- [Divi 5 Migration Prompt Pack](https://www.respira.press/docs/toolkits/divi-5-migration-prompt-pack)
- [Divi 5 Migration Readiness Report](https://www.respira.press/docs/toolkits/divi-5-migration-readiness-report)
