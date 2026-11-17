# Admin Setup: Respira Community Hub

One-time setup guide for transforming respira-docs into the community repo.

## Pre-Flight Checklist

**Complete these BEFORE running any rename commands:**

- [ ] All changes merged to main branch
- [ ] Docs build successfully: `npm run build` (or your build command)
- [ ] No secrets or private code anywhere in commits
- [ ] Review TODO_POST_RENAME.md (you'll need it after rename)
- [ ] Optional: Clone repo as backup just in case

**After rename, you'll need a follow-up PR for repo name references.**
See TODO_POST_RENAME.md for the list.

---

## 1. CLI commands (run AFTER merging and pushing)

### Check auth

```bash
gh auth status
```

### Rename repo

From the repo root (respira-docs):

```bash
gh repo rename community
```

### Update description and enable Discussions

```bash
gh repo edit --description "Respira for WordPress Community. Docs, support, prompt recipes, and roadmap." --enable-discussions
```

If `--enable-discussions` is not supported, enable via UI (see below).

---

## 2. One-time GitHub UI steps

### Enable Discussions (if not enabled via CLI)

1. Go to repo **Settings** → **General**
2. Scroll to **Features**
3. Check **Discussions**

### Create discussion categories

1. Go to **Discussions** tab
2. Click **New category** (or equivalent)
3. Create discussion categories (exact names):
   - **Announcements**
   - **Q&A**
   - **Troubleshooting**
   - **Prompt Recipes**
   - **Feature Requests**
   - **Showcase**
   - **Community Meta**
   - **Roadmap** (optional)

### Publish discussion drafts

From repo root (after rename to `community`):

```bash
npm run publish:discussions
```

Or with explicit repo:

```bash
REPO=respira-press/Respira.press-Documentation-and-Community node scripts/publish-discussions.mjs
```

### Pin discussions

1. Go to **Discussions**
2. Open: **Start Here: What Respira for WordPress is (and is not)**
3. Click **Pin discussion** (⋯ menu or sidebar)
4. Open: **Read this before posting: Support rules + redaction checklist**
5. Pin this one too

### Enable Wiki

1. Go to repo **Settings** → **General**
2. Scroll to **Features**
3. Check **Wikis**
4. Clone wiki repo: `git clone https://github.com/respira-press/Respira.press-Documentation-and-Community.wiki.git`
5. Copy `wiki/*.md` into wiki repo root, then commit and push
6. See [WIKI_SETUP.md](./WIKI_SETUP.md) for full checklist

---

## 3. Go-live checklist (≈30 min)

- [ ] Merge PR (`chore/community-hub` → `main`)
- [ ] Rename repo: `gh repo rename community`
- [ ] Update description: `gh repo edit --description "..." --enable-discussions`
- [ ] Enable Discussions (UI if needed)
- [ ] Create discussion categories
- [ ] Run `npm run publish:discussions`
- [ ] Pin: "Start Here" and "Support rules"
- [ ] Enable Wiki and push initial pages (see WIKI_SETUP.md)
- [ ] Publish "Community Wiki is live" discussion (draft: 14-wiki-launch.md)
- [ ] Update Documentation.ai (if it points to repo URL)
- [ ] Update external links (respira.press, product site) that point to `github.com/respira-press/Respira.press-Documentation-and-Community`

---

## 4. Post-rename verification

- [ ] `https://github.com/respira-press/Respira.press-Documentation-and-Community` loads
- [ ] Discussions tab visible
- [ ] www.respira.press/docs still works (Documentation.ai may need repo re-link)
- [ ] Redirect: `github.com/respira-press/Respira.press-Documentation-and-Community` → `github.com/respira-press/Respira.press-Documentation-and-Community` (GitHub provides this automatically for a while)
