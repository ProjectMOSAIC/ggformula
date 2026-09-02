# Changelog

## ggformula (development version)

- [`layer_factory()`](../reference/layer_factory.md) the core function
  that creates `gf_*()` functions has been largely refactored. Most
  existing behavior remains unchanged (aside from bug fixes).
- It is now possible to specify all aesthetics with `name = ~ variable`
  syntax. For example: `gf_point( x = ~ var`, y = ~ var2`, ...)` is
  equivalent to `gf_point(var2 ~ var 1)`.
- It is now easier to create wrappers around additional stats and geoms.
  There is a vignette describing how to do so.
- Bug fix: `inherit = FALSE` was silently ignored by `gf_*()` functions
  built with an explicit `layer_fun` naming a `geom_*()` constructor
  rather than the default
  [`ggplot2::layer()`](https://ggplot2.tidyverse.org/reference/layer.html)
  – most visibly [`gf_violin()`](../reference/gf_violin.md), which
  adopted `layer_fun = ggplot2::geom_violin` in 1.1.0. `inherit.aes` is
  now forwarded whenever the layer function declares it, so
  `gf_violin(..., inherit = FALSE)` again creates a layer that does not
  inherit the plot’s aesthetics.
  [`gf_abline()`](../reference/gf_lines.md),
  [`gf_hline()`](../reference/gf_lines.md), and
  [`gf_vline()`](../reference/gf_lines.md) are unaffected: they are
  built with `inherit.aes = FALSE`, matching those geoms’ own defaults.
- Bug fix: relatedly, `inherit = FALSE` was ignored by every
  `gf_*_interactive()` function, since those are built on
  `layer_interactive()` rather than
  [`ggplot2::layer()`](https://ggplot2.tidyverse.org/reference/layer.html).
  `layer_interactive()` now accepts and forwards `inherit.aes`, so e.g.
  `gf_point_interactive(..., inherit = FALSE)` behaves like
  `gf_point(..., inherit = FALSE)`. When not supplied, `inherit.aes` is
  omitted rather than forwarded as `NULL`, leaving the underlying geom’s
  own default in force.

## ggformula 1.1.0

- New feature: [`layer_factory()`](../reference/layer_factory.md) gains
  a `required_packages` argument for extension-package authors. Naming
  one or more packages there (e.g. `required_packages = "ggforce"`)
  checks, before anything else runs (including `pre`), that each is both
  installed and attached (via
  [`library()`](https://rdrr.io/r/base/library.html)), raising an
  informative error otherwise. This replaces the hand-written
  `pre`-block checks previously used internally, e.g. in
  [`gf_sina()`](../reference/gf_sina.md); see the new “Extending
  ggformula” vignette
  ([`vignette("extending-ggformula")`](../articles/extending-ggformula.md))
  for details. `required_packages` is also recorded in a function’s
  [`ggformula_spec()`](../reference/ggformula_spec.md).
- New feature: [`layer_factory()`](../reference/layer_factory.md) also
  gains `installed_packages`, a lighter-weight sibling of
  `required_packages` that only checks that a package is installed, not
  that it’s attached – the right fit for functions (built with the
  `layer_fun =` pattern) that call an extension package’s function
  directly via `pkg::fun()`. [`gf_sf()`](../reference/gf_sf.md) now uses
  `installed_packages = "sf"` instead of its hand-written `pre` check.
  Also recorded in [`ggformula_spec()`](../reference/ggformula_spec.md).
- New feature: aesthetics that are normally supplied via the formula can
  now also be supplied as named arguments using formula syntax, e.g.
  `gf_point(x = ~var1, y = ~var2, data = df)` works like
  `gf_point(var2 ~ var1, data = df)`. This generalizes to every `gf_*`
  function’s formula “roles”, not just `x`/`y` (for example
  `gf_ribbon(ymin = ~lo, ymax = ~hi, x = ~t, data = df)` works like
  `gf_ribbon(lo + hi ~ t, data = df)`). If a role is supplied both via a
  literal formula and as a named argument, the named argument wins and a
  warning is emitted.
- Bug fix: [`gf_hline()`](../reference/gf_lines.md),
  [`gf_vline()`](../reference/gf_lines.md),
  [`gf_abline()`](../reference/gf_lines.md), and similar functions used
  with `data = NA` (i.e., with all values supplied directly rather than
  from a data frame) could error or silently pass duplicated/incorrect
  arguments (such as `position`) down to the underlying geom, because
  argument names shared with ggplot2’s `geom_*()`/`stat_*()`
  constructors (`data`, `mapping`, `position`, `show.legend`,
  `inherit.aes`, `geom`, `stat`) were incorrectly treated as generic
  settable parameters. This also fixed a related failure in some
  `gf_*_interactive()` layers (e.g.
  `gf_jitter_interactive(width = ...)`) that could error with “Both
  `position` and `width`/`height` were supplied.”
- Bug fix: replaced remaining internal use of the removed/deprecated
  [`aes_string()`](https://ggplot2.tidyverse.org/reference/aes_.html)
  (used only in the `data = NA` code path above) with a tidy-eval
  equivalent.
- Internal refactor: the body of the function created by
  [`layer_factory()`](../reference/layer_factory.md) (used to build
  every `gf_*` function) has been decomposed into small, individually
  documented helper functions, one per stage of the “formula -\> ggplot2
  layer” pipeline. This is intended to make the code easier to read,
  test, and extend; no behavior changes are intended from this refactor
  alone.
- Internal: every function created by
  [`layer_factory()`](../reference/layer_factory.md) now records an
  explicit, documented specification (retrieved with the new
  [`ggformula_spec()`](../reference/ggformula_spec.md)) of the `geom`,
  `stat`, `position`, `aes_form`, `extras`, `pre`, `aesthetics`,
  `inherit.aes`, `check.aes`, `required_packages`, and
  `installed_packages` it was built with.
  [`interactive_layer_factory()`](../reference/interactive_layer_factory.md)
  now reads that single documented record instead of scraping several
  loosely-related bindings out of a `gf_*` function’s environment, and
  extension packages can use it too.
- Removed unused internal code: `R/ggstrings.R` (unused string-based
  ggplot2-code generators from an earlier design), `formula_shape0()`
  (superseded by `formula_shape()`), and `formula2aes()`/`list2aes()`
  (unused, and relied on the deprecated
  [`aes_()`](https://ggplot2.tidyverse.org/reference/aes_.html)).

## ggformula 1.0.1

CRAN release: 2026-01-17

- Fixes issues with documentation after an update to {ggplot2}.

## ggformula 1.0.0

CRAN release: 2025-10-06

- Added support for interactive graphics based on {ggiraph}.
- Modifications to support {ggplot2} version 4.0.

## ggformula 0.12.2

CRAN release: 2025-07-31

- Added [`gf_guides()`](../reference/gf_guides.md) and
  [`gf_annotate()`](../reference/gf_annotate.md).
- Bug fix in GeomLm to avoid warning about deprecated size aesthetic.
- Deprecated functions that relied on ggstance (no longer supported)
  have been made defunct.
- Updated documentation according to new CRAN policies.

## ggformula 0.12.1

- Bug fix in gf_dist()

## ggformula 0.12.0

CRAN release: 2023-11-09

- Removed dependency on ggstance so that ggformula can work with WebR
- Deprecated horizontal versions of many plotting functions to remove
  dependence on ggstance and because ggplot2 now supports horizontal
  versions of most geoms.
- Examples have been updated to use `|>` rather than `%>%`
- Updates to documentation (formatting mostly)
- Bug fix: found one remaining use of
  [`stat()`](https://ggplot2.tidyverse.org/reference/aes_eval.html) and
  changed to
  [`after_stat()`](https://ggplot2.tidyverse.org/reference/aes_eval.html)

## ggformula 0.10.4

CRAN release: 2023-04-11

- Updated the re-export of a few functions from `labelled`.
  ([\#160](https://github.com/ProjectMOSAIC/ggformula/issues/160))
- Migrated from
  [`stat()`](https://ggplot2.tidyverse.org/reference/aes_eval.html) to
  [`after_stat()`](https://ggplot2.tidyverse.org/reference/aes_eval.html)
  to avoid deprecation notices from `ggplot2`.
  ([\#156](https://github.com/ProjectMOSAIC/ggformula/issues/156))
- Migrated from `size` to `linewidth` for line-like geoms to avoid
  deprecation notices from `ggplot2`.
  ([\#155](https://github.com/ProjectMOSAIC/ggformula/issues/155))

## ggformula 0.10.2

CRAN release: 2022-08-31

- Added improvements to [`gf_hline()`](../reference/gf_lines.md), etc.
  responding to changes in {ggplot2}. See
  [\#128](https://github.com/ProjectMOSAIC/ggformula/issues/128).
- Added support for nonsyntactic names in formulas. Among other things,
  this allows for using backticks around such names. See
  [\#152](https://github.com/ProjectMOSAIC/ggformula/issues/152) and
  [\#153](https://github.com/ProjectMOSAIC/ggformula/issues/153)
- Added examples of [`gf_lm()`](../reference/gf_smooth.md) with
  non-default models.

## ggformula 0.10.0

- Added [`gf_ridgeline()`](../reference/ggridges.md),
  `gf_ridgeline_gradient()`,
  [`gf_density_ridges()`](../reference/ggridges.md),
  [`gf_density_ridges_gradient()`](../reference/ggridges.md).
- [`gf_dens()`](../reference/gf_density.md) now uses
  `geom = "geom_density_line"`. This allows setting fill.
- Plots now label variables with labels created in data using
  `labelled`, `expss` or `Hmisc` labeling functions
- To reduce the size of the package, the main vignette has been
  shortened. The full version is available at
  <https://www.mosaic-web.org/ggformula/>.
- Two other vignettes have been moved to online only for the same
  reason.

## ggformula 0.9.4

CRAN release: 2020-03-04

- internal updates precipated by changes to ggplot2.

## ggformula 0.9.3

CRAN release: 2020-02-11

- add [`gf_sina()`](../reference/gf_sina.md).
  ([\#134](https://github.com/ProjectMOSAIC/ggformula/issues/134))
- update exampels involving
  [`sf::st_as_sf()`](https://r-spatial.github.io/sf/reference/st_as_sf.html)
  to reflect updated names of in the resulting data frame. This is
  required to get CRAN builds to work without an error.
  ([\#137](https://github.com/ProjectMOSAIC/ggformula/issues/137))
- Add helpful error message if dist is not a string in
  [`gf_dist()`](../reference/gf_dist.md).
  ([\#133](https://github.com/ProjectMOSAIC/ggformula/issues/133))

## ggformula 0.9.2

CRAN release: 2019-09-05

- Some internals in [`layer_factory()`](../reference/layer_factory.md)
  have been reimplemented to avoid making copies of ggplot2 functions at
  compile time. This should make things more stable when updating
  ggplot2 but not updating ggformula.
- Two new graphing functions were added:
  [`gf_ellipse()`](../reference/gf_ellipse.md) and
  [`gf_ecdf()`](../reference/gf_ecdf.md)
- [`gf_rugx()`](../reference/gf_rug.md) and
  [`gf_label()`](../reference/gf_text.md) have been modified a bit to
  make them easier to use.
- Evaluation environments are now handled more stably. Instead of using
  the environment of the formula, the `environment` argument is used.
  After some delay, this completes the migration to ggplot2 version 2.2
  ([\#96](https://github.com/ProjectMOSAIC/ggformula/issues/96),
  [\#125](https://github.com/ProjectMOSAIC/ggformula/issues/125))
- Bug fix in [`gf_dist()`](../reference/gf_dist.md) to avoid an error
  when using `params`.
  ([\#119](https://github.com/ProjectMOSAIC/ggformula/issues/119))
- Default in [`gf_errorbar()`](../reference/gf_errorbar.md) is now
  `inherit = TRUE`. The old default was required due to inconvenient
  naming of aesthetics in
  [`geom_errorbar()`](https://ggplot2.tidyverse.org/reference/geom_linerange.html),
  but those names have been changed now.
  ([\#120](https://github.com/ProjectMOSAIC/ggformula/issues/120))
- New function: [`discrete_breaks()`](../reference/discrete_breaks.md).

## ggformula 0.9.1

CRAN release: 2019-01-12

This release includes a few minor improvements, including

- Updated examples so they work better with pkgdown
- Other document improvements

## ggformula 0.9.0

CRAN release: 2018-08-03

- `ggformula` now requires `ggplot2 (>= 3.0.0)`. This should take care
  of issues in 0.8.0 when `ggplot2` was upgraded *after* upgrading
  `ggformula`.
- `pkgdown` website created at <https://www.mosaic-web.org/ggformula/>
- Several horizontal versions of geom and stats are implemented using
  `ggstance`.
- `vdiffr` is used for testing plot output

## ggformula 0.8.0

CRAN release: 2018-06-26

- The internals of all of the `gf_` functions have been modified to make
  them work with `ggplot2` version 2.3. In future releases, a version
  `ggplot2` at least this new will be required.

- The default value for `se` in
  [`gf_smooth()`](../reference/gf_smooth.md) has been changed from
  `TRUE` to `FALSE`.

- [`gf_sf()`](../reference/gf_sf.md) added to support simple features
  data for maps.

- improved documentation and examples

## ggformula 0.7.0

CRAN release: 2018-05-22

- Formulas of the shape `y ~ .` can be used for plots that require a `y`
  aesthetic but no `x` aesthetic.
- Added [`gf_rugx()`](../reference/gf_rug.md) and
  [`gf_rugy()`](../reference/gf_rug.md). Also additional examples using
  rugs are given in the documentation.
- Added [`gf_polygon()`](../reference/gf_polygon.md) for simple maps.
  (Improved mapping capabilities should be coming when `ggplot2` hits
  version 2.3.)
- Some internals have been reworked to improve the processing of
  arguments and deciding when to display the quick help for plotting
  functions.
- Modifications to the environments in which some functions are
  evaluated.

## ggformula 0.6.2

CRAN release: 2018-02-06

- Improved scoping of `gf_` functions makes it easier to work with data
  in the global environment.
- New functions [`gf_props()`](../reference/gf_bar.md) and
  [`gf_percents()`](../reference/gf_bar.md) added to simplify creating
  bar graphs on a proportion or percent scale.
- New arguments `xlab`, `ylab`, `title`, `subtitle`, and `caption` added
  to `gf_` functions. In the case of
  [`gf_props()`](../reference/gf_bar.md) and
  [`gf_percents()`](../reference/gf_bar.md) these are prepopulated with
  defaults of “proportion” and “percent” to give nicer labeling of the
  plot.
- The use of `weatherData` has been removed since that package is no
  longer on CRAN
- Improvements to [`gf_abline()`](../reference/gf_lines.md),
  [`gf_hline()`](../reference/gf_lines.md), and
  [`gf_vline()`](../reference/gf_lines.md) expand the usable portion of
  the API.
- Additional examples for some functions.

## ggformula 0.6.1

CRAN release: 2018-01-03

Minor update primarily to support vignette data sets moving from
`StatisticalModeling` to `mosaicModel`.

- Also added [`gf_fitdistr()`](../reference/gf_fitdistr.md).

## ggformula 0.6.0

Mostly minor changes:

- Improved documentation of gf\_ functions.
- na.warn() is now re-exported.
- Bug fix in gf_violin().
- Reformatted quick help messages.

## ggformula 0.5.0

For version 0.5, the internals of `ggformula` have been largely
redesigned to allow implementation of some new features. The new version
relies much less on string parsing.

- Some important changes to formula parsing include

  - `attribute:value` and `attribute::expression` are no longer
    supported within the main formula.
  - In exchange, things like `gf_point(1:10 ~ 1:10)` work, making it
    simpler to create on the fly plots without having to build a data
    frame first.
  - `y ~ 1` is equivalent to `~ y` in functions that allow the `~ y`
    formula shape. Example: `gf_histogram(age ~ 1)` and
    `gf_histogram( ~ age)` are equivalent

- Some new functions have been added

  - [`gf_dist()`](../reference/gf_dist.md) can plot distributions
  - [`gf_dhistogram()`](../reference/gf_histogram.md) plots density
    histograms by default
  - [`gf_ash()`](../reference/gf_ash.md) creates ASH plots

- [`df_stats()`](https://rdrr.io/pkg/mosaicCore/man/df_stats.html) has
  been improved to handle one-sided formulas better.

- Secondary layers are now able to inherit both data and formula-defined
  attributes from the primary layer. Use `inherit = FALSE` if you don’t
  want inheritance. (A few functions have `inherit = FALSE` as their
  default because it seems unlikely that inheriting will be desireable.)

## ggformula 0.4.0

CRAN release: 2017-06-21

Version 0.4.0 constitutes a stable beta release. Changes to the API are
still possible, but more likely future changes will focus on expansion
of the suite of functions supplied, changes to the internal
implementation, and improved documentation.

- Separated `ggformula` from `statisticalModeling`.
- Added support for many more geoms.
- Improved parsing of formulas. This is still a bit clunky since the
  order of operations in R formulas does not match what we would prefer
  in this package.
- `data` may now be an expression (like
  `data = KidsFeet %>% filter(sex == "G")`)
- Added support for geoms that have different required aesthetics.
- Added support for functions that allow more than one formula shape.
  Example: [`gf_histogram()`](../reference/gf_histogram.md) accepts
  formulas with shape `~ x` or `y ~ x`. This makes it possible to create
  density histograms with
  [`gf_histogram()`](../reference/gf_histogram.md).
- Parentheses now halt parsing of formulas. This allows for on-the-fly
  computations in formulas. Typically these computed expressions must be
  within parentheses to avoid formula expansion.
- Use `::` to indicate mapping aesthetics. (`:` will autodetect, but
  only if the value is the name of a variable in the data set.) This
  should be considered experimental.
- Added wrappers [`gf_lims()`](../reference/gf_aux.md),
  [`gf_labs()`](../reference/gf_aux.md),
  [`gf_theme()`](../reference/gf_theme.md),
  [`gf_facet_grid()`](../reference/gf_facet_grid.md),
  [`gf_facet_wrap()`](../reference/gf_facet_grid.md)
- Added [`gf_refine()`](../reference/gf_aux.md) which can be used to
  pass by chaining anything that would have been “added” in \``ggplot2`
- Expanded and improved vignette describing use of the package.
- Added two tutorials.
- Added “quick help” for plotting functions.
- Added [`gf_lm()`](../reference/gf_smooth.md), which is
  [`gf_smooth()`](../reference/gf_smooth.md) with `method = "lm"`
- Added [`gf_dens()`](../reference/gf_density.md) which is
  [`gf_line()`](../reference/gf_line.md) with `stat = "density"`.
