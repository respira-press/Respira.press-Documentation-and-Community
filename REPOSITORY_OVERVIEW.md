# Repository Overview

Internal reference for the respira-docs → community hub transition.

## Docs Framework

**Documentation.ai** (SaaS hosted). Not Docusaurus, MkDocs, VitePress, or Next.js. The docs are built and deployed by Documentation.ai based on:

- `documentation.json` — nav, sidebar, tabs, navbar config
- `.mdx` files — content (root + folders: builders, guides, tools, security, support, woocommerce, toolkits, troubleshooting, reference)
- `openapi.yaml` — API reference source

## How Docs Build

- No local build step in this repo.
- Documentation.ai pulls from the repo and renders docs at www.respira.press/docs.
- Push to main triggers automatic deployment (via Documentation.ai integration, not GitHub Actions in this repo).

## Where Repo Name Appears

| Location | Current | After Rename |
|----------|---------|--------------|
| GitHub repo name | respira-docs | community |
| GitHub URL | github.com/respira-press/Respira.press-Documentation-and-Community | github.com/respira-press/Respira.press-Documentation-and-Community |
| documentation.json navbar | GitHub: respira/vibe-coding, Support: support.vibe-coding.com | Update to community Discussions URL |
| .github/ISSUE_TEMPLATE/config.yml contact_links | N/A (new file) | github.com/respira-press/Respira.press-Documentation-and-Community/discussions |

**Note:** No hardcoded "respira-docs" or "respira-press/Respira.press-Documentation-and-Community" strings found in repo (grep). Documentation.ai likely infers repo from GitHub connection.

## Deployment Risk Notes

- **Rename impact:** If Documentation.ai is configured by repo URL (e.g. github.com/respira-press/Respira.press-Documentation-and-Community), it may need to be reconfigured to point at github.com/respira-press/Respira.press-Documentation-and-Community after rename. Check Documentation.ai dashboard.
- **Edit this page:** Documentation.ai may provide "Edit on GitHub" links. These will break when repo is renamed unless Documentation.ai auto-follows redirects (GitHub redirects renamed repos for a while).
- **External links:** Any external site linking to github.com/respira-press/Respira.press-Documentation-and-Community will need updates. GitHub provides redirects for renamed repos.
- **CI/CD:** No GitHub Actions workflows found in repo. Build/deploy is external.
