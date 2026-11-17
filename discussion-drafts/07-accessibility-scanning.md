---
title: "Accessibility scanning: how to read results (and what automation cannot catch)"
category: "Q&A"
---

Automated scans are useful, but they are not a legal verdict and not a full manual audit.

What scanners are good at:

- missing alt text
- contrast issues (some)
- ARIA attribute problems
- form label associations

What scanners miss:

- meaningful alt text quality
- keyboard navigation experience
- content clarity and structure
- many context-dependent WCAG checks

When you share scan results, redact:

- private domains
- user data

Docs:

- [Analyze Images](https://www.respira.press/docs/tools/analysis/analyze-images) (alt text and image accessibility)
- [Analyze AEO](https://www.respira.press/docs/tools/analysis/analyze-aeo) (AI Engine Optimization, content structure)
- [Check Structured Data](https://www.respira.press/docs/tools/analysis/check-structured-data)
