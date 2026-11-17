---
title: "Elementor: supported workflows, known gotchas, and safe patterns"
category: "Ideas"
---

If you're using Elementor, start with these safe patterns:

- duplicate the page/template first
- keep changes small
- verify responsive breakpoints

Known gotchas (from docs):

- Target widgets by custom CSS ID (`_element_id`) for reliable updates
- Elementor stores layouts as JSON in `_elementor_data` post meta
- Avoid batch edits across many pages in one run; do one page at a time for critical content

Recommended workflows:

- [Read page](https://www.respira.press/docs/tools/pages/read-page) → inspect structure
- [Create duplicate](https://www.respira.press/docs/tools/pages/create-duplicate) → safe copy
- [Update page](https://www.respira.press/docs/tools/pages/update-page) → edit the duplicate
- Approve in WordPress Admin (Respira → Approve Edits)

Docs:

- [Elementor Builder Reference](https://www.respira.press/docs/builders/elementor)
