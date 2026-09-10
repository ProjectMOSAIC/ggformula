# Notes for agents working on this repo

## Keep this file out of the public pkgdown site

`pkgdown::build_site()` (specifically `build_home()`) auto-publishes
every top-level `*.md` file it finds, this one included -- there's no
`_pkgdown.yml` option to exclude a specific file, and the exemption
list (`README.md`, `LICENSE.md`, `NEWS.md`, a few CI files) is
hardcoded in pkgdown itself. After every `pkgdown::build_site()` /
`build_home()`, run:

```bash
Rscript pkgdown/remove-internal-pages.R
```

which deletes `docs/AGENTS.md` / `docs/AGENTS.html` and strips the
corresponding entry from `docs/sitemap.xml`.

## webR / quarto-live tutorials

Interactive tutorials use the [`r-wasm/quarto-live`](https://github.com/r-wasm/quarto-live)
extension (`format: live-html`, `{webr}` code chunks) to run R in the
browser. Two working examples:

- `tutorials/plotting-with-formulas.qmd`
- `tutorials/refining-ggformula.qmd`

### Current setup: standalone pages, not pkgdown articles

These are plain quarto documents rendered with `quarto render`, never
touched by `pkgdown::build_articles()`. `pkgdown/build-webr-tutorials.R`
renders both and copies the output into `docs/tutorials/`:

```bash
Rscript pkgdown/build-webr-tutorials.R
```

Run it whenever `tutorials/*.qmd` changes; independent of
`pkgdown::build_site()` (order between the two doesn't matter). Each
page keeps quarto-live's own complete, correctly-styled theme and has a
plain markdown link back to <https://www.mosaic-web.org/ggformula/>
instead of the pkgdown navbar. `_pkgdown.yml`'s `navbar.components.tutorials.menu`
points at `tutorials/*.html` so they're still reachable from the site's
own navbar.

The quarto-live extension lives in `tutorials/_extensions/`, installed
with:

```bash
cd tutorials
quarto add r-wasm/quarto-live --no-prompt
```

`tutorials/` and `.claude/` are both excluded from the CRAN tarball via
`.Rbuildignore` -- none of this is part of the installed package.

### Why not just make them pkgdown articles? (history -- don't redo this)

They used to live in `vignettes/articles/` and get built by
`pkgdown::build_articles()` like any other article. Don't go back to
that. Every fix for one symptom of mixing quarto-live's `live-html`
output with pkgdown's article template created a new one:

1. **Extension invisible**: `pkgdown::build_articles()` turns
   `vignettes/` into its own quarto *project* (writes a temporary
   `vignettes/_quarto.yaml`). Quarto extension lookup stops at the
   project root, so an extension installed outside `vignettes/` is
   invisible to that render (`Unable to read the extension 'live'`).

2. **Exercises never mount**: `pkgdown:::data_quarto_article()` builds
   each article page from only the `<head>` `<script>`/`<link>` tags
   and the contents of `<main>`. quarto-live's own bootstrap script --
   the one that calls `window._ojs.runtime.interpretFromScriptTags()`
   to actually mount the interactive exercises -- is emitted *after*
   `</main>`, so pkgdown's extraction silently drops it. Exercises work
   in `quarto preview` (raw quarto output) and stay blank once built
   through pkgdown, with no error.

3. **Fixing #2 breaks the navbar**: any OJS-engine document (which
   quarto-live requires) also gets its own bundled Bootstrap 5 from
   quarto -- a `<link id="quarto-bootstrap">` and a
   `.../libs/bootstrap/bootstrap.min.js`. pkgdown's extraction keeps
   both verbatim (it filters jquery specifically, not bootstrap), so
   the page loads two independent copies of Bootstrap: pkgdown's own
   and quarto's. The duplicate CSS overrides the site theme (steelblue
   navbar instead of the site's colors); the duplicate JS registers a
   second, independent set of document-level Bootstrap Dropdown click
   handlers that fight pkgdown's own, leaving the navbar dropdowns
   dead.

4. **Fixing #3 breaks quarto's own component styling**: the tempting
   fix for #3 is to strip quarto's bootstrap `<link>`/`<script>` from
   the built HTML (we did this for a while, via a
   `pkgdown/fixup-webr-bootstrap.R` post-build script -- since removed).
   That file isn't *just* Bootstrap, though -- quarto compiles its own
   component styles into the same stylesheet, callouts included. Strip
   it and `::: {.callout-note}` etc. lose their styling (no colored
   border, no icon, no background). pkgdown's own vanilla Bootstrap CSS
   has zero callout rules to fall back on.

`theme: none` in the qmd front matter does not sidestep any of this --
it changes quarto's own document structure so `<main>` ends up
essentially empty, and pkgdown's extraction (which depends on `<main>`
containing the real content) then drops the exercises entirely, a
strictly worse outcome. `pkgdown: as_is: true` doesn't help either --
`build_quarto_articles()` never reads that field; it's an Rmd-only
option with no effect on `.qmd` files.

This is why standalone rendering (see above) is the current approach:
it isn't a smaller patch, it just doesn't create this whole class of
conflict, because quarto's output is never merged with pkgdown's
template at all.

**How to verify a new tutorial actually works before committing**: a
local `quarto render` succeeding is *not* sufficient evidence that
everything downstream is fine -- render it, then actually open the
output HTML in a browser (a plain `python3 -m http.server` from inside
`tutorials/` is enough) and confirm the exercise "Run Code" buttons
appear and produce real output, not just that the page loads without a
console error.
