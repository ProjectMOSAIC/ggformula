# Notes for agents working on this repo

## webR / quarto-live tutorials on the pkgdown site

Interactive tutorials use the [`r-wasm/quarto-live`](https://github.com/r-wasm/quarto-live)
extension (`format: live-html`, `{webr}` code chunks) to run R in the
browser. Two working examples:

- `vignettes/articles/plotting-with-formulas.qmd`
- `vignettes/articles/refining-ggformula.qmd`

Two non-obvious things you need to know before adding another one of
these:

### 1. The extension must live in `vignettes/_extensions/`, not `_extensions/` at the repo root

`pkgdown::build_articles()` turns `vignettes/` into its own quarto
*project* (it writes a temporary `vignettes/_quarto.yaml`) when
rendering `.qmd` articles. Quarto extension lookup stops at the
project root, so an extension installed at the repo root is invisible
to that render and fails with `Unable to read the extension 'live'`.
Install it from the `vignettes/` directory:

```bash
cd vignettes
quarto add r-wasm/quarto-live --no-prompt
```

### 2. webR exercises render in `quarto preview` but stay blank on the deployed pkgdown site -- you need a re-trigger script

This is the one that will burn the most time if you don't know about
it. Symptoms: `quarto preview` (or any raw `quarto render` output)
shows working "Run Code" exercise editors, but the exact same content
built via `pkgdown::build_site()` shows nothing where the exercises
should be -- no error, no editor, just empty `<div class="exercise-cell">`
containers. webR itself initializes fine and packages download; the
exercises just never mount.

**Root cause**: `pkgdown:::data_quarto_article()` (in pkgdown's own R
source) builds each article page from only two things: the `<script>`/
`<link>` tags in `<head>`, and the contents of `<main>`. quarto-live
emits its own bootstrap script -- the one that actually calls
`window._ojs.runtime.interpretFromScriptTags()` to mount the
interactive exercises -- *after* `</main>`, right before `</body>`.
pkgdown's extraction silently drops it, so that call never happens.
Confirmed by reading pkgdown's source directly (`data_quarto_article`
in the installed package) and by manually invoking
`window._ojs.runtime.interpretFromScriptTags()` in the browser console
on a broken deployed page, which immediately fixed it.

`pkgdown: as_is: true` in the qmd front matter does **not** help --
`build_quarto_articles()` never reads that field; it's an Rmd-only
option.

**The fix**: end the `.qmd` content (i.e. inside the document body, not
in the YAML front matter, so it lands inside `<main>` and survives
pkgdown's extraction) with:

```html
<script type="module">
// pkgdown's article extraction (pkgdown:::data_quarto_article()) keeps
// only the <head> scripts/links and the contents of <main>. quarto-live
// appends its own bootstrap script -- the one that calls
// `window._ojs.runtime.interpretFromScriptTags()` to actually mount the
// interactive exercises -- *after* </main>, so pkgdown silently drops
// it and none of the exercises render on the pkgdown site (they still
// work in `quarto preview`, which serves quarto's raw output). Re-run
// it ourselves if that never happened. Deferred to a macrotask so
// quarto's own trigger (present when this file isn't run through
// pkgdown) gets a chance to run first, avoiding a double interpretation.
await new Promise((resolve) => setTimeout(resolve, 0));
const alreadyMounted = document.querySelector(".exercise-cell")?.children.length > 0;
if (!alreadyMounted && window._ojs?.runtime) {
  window._ojs.runtime.interpretFromScriptTags();
}
</script>
```

Just copy this block verbatim into any new webR tutorial. The
`setTimeout(resolve, 0)` defer plus the `alreadyMounted` check makes it
a no-op when quarto's own trigger is present (i.e. under `quarto
preview` / raw `quarto render`), so it's safe to always include.

**How to verify a new tutorial actually works before committing**: a
local `quarto render` succeeding is *not* sufficient evidence -- it
doesn't exercise pkgdown's extraction path at all. Run
`pkgdown::build_articles()` (or `build_site()`), serve `docs/` with a
plain static file server (`python3 -m http.server` from inside `docs/`
-- deliberately no special headers, to match a real static host), and
confirm in a browser that the exercise "Run Code" buttons actually
appear and produce output, not just that the page loads without a
console error.

### 3. Once the exercises mount, the pkgdown navbar breaks: wrong colors, dead dropdowns

Symptom: the navbar background turns steelblue (instead of matching the
site theme) and the "Articles"/"Tutorials" dropdown menus stop opening
-- but only on pages that use `format: live-html`.

**Root cause**: any document using the OJS engine (which quarto-live
requires) gets its own bundled copy of Bootstrap from quarto --
`<link id="quarto-bootstrap" ...>` and
`<script src=".../libs/bootstrap/bootstrap.min.js">` in `<head>`.
pkgdown's article extraction keeps `<head>` scripts/links verbatim (it
filters out jquery specifically, but not bootstrap), so the page ends
up with two independent copies of Bootstrap 5 loaded at once: pkgdown's
own (`deps/bootstrap-5.3.8/...`) and quarto's. The duplicate CSS
overrides the site's theme colors; the duplicate JS registers a second,
independent set of document-level Bootstrap Dropdown click handlers
that conflict with pkgdown's own and leave the navbar dropdowns dead.

Confirmed by isolating each tag: removing only quarto's `<link
id="quarto-bootstrap">` fixes the colors; removing only quarto's
`bootstrap.min.js` fixes the dropdowns; you need both gone. Also
confirmed `theme: none` is not a fix -- it changes quarto's own
document structure so `<main>` ends up essentially empty, and
pkgdown's extraction (which keeps only `xpath "//main"` for the body)
then drops the real content, including the exercises, entirely.

quarto's `bootstrap.min.js` is a plain classic `<script>` (no
`type="module"`, no `defer`) in `<head>`, so it runs synchronously
while the page is still being parsed -- before any content we control
in the body/`<main>` even exists yet. That means this can't be patched
client-side (there's nothing left to intercept by the time our own
scripts run); it has to be stripped from the built HTML before it's
served. Confirmed removing both tags has no effect on the exercises
themselves -- quarto-live's UI doesn't use Bootstrap's JS components.

**The fix**: run `pkgdown/fixup-webr-bootstrap.R` after every
`pkgdown::build_site()` / `build_articles()`. It strips both tags from
every built article that has them (detected automatically, so it
covers future webR tutorials too):

```bash
Rscript pkgdown/fixup-webr-bootstrap.R
```

This is a real gap in the workflow right now -- there's no pkgdown
hook to run this automatically as part of `build_site()`, so it's a
manual step. If you add another webR tutorial, don't forget it, and
verify the *navbar* (not just the exercises) after building, the same
way described in point 2 above.
