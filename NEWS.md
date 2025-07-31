# ggformula

# ggformula 0.12.2

* Added `gf_guides()` and `gf_annotate()`.
* Bug fix in GeomLm to avoid warning about deprecated size aesthetic.
* Deprecated functions that relied on ggstance (no longer supported) have been made defunct.
* Updated documentation according to new CRAN policies.

# ggformula 0.12.1

* Bug fix in gf_dist()

# ggformula 0.12.0

* Removed dependency on ggstance so that ggformula can work with WebR
* Deprecated horizontal versions of many plotting functions to remove dependence on ggstance and
because ggplot2 now supports horizontal versions of most geoms.
* Examples have been updated to use `|>` rather than `%>%`
* Updates to documentation (formatting mostly)
* Bug fix: found one remaining use of `stat()` and changed to `after_stat()`

# ggformula 0.10.4

* Updated the re-export of a few functions from `labelled`. (#160)
* Migrated from `stat()` to `after_stat()` to avoid deprecation notices from `ggplot2`. (#156)
* Migrated from `size` to `linewidth` for line-like geoms to avoid deprecation notices from `ggplot2`. (#155)

# ggformula 0.10.2

* Added improvements to `gf_hline()`, etc. responding to changes in {ggplot2}.  See #128.
* Added support for nonsyntactic names in formulas.  Among other things, this allows for
  using backticks around such names.  See #152 and #153
* Added examples of `gf_lm()` with non-default models.


# ggformula 0.10.0

* Added `gf_ridgeline()`, `gf_ridgeline_gradient()`, `gf_density_ridges()`, `gf_density_ridges_gradient()`.
* `gf_dens()` now uses `geom = "geom_density_line"`.  This allows setting fill.
* Plots now label variables with labels created in data using `labelled`, `expss` or `Hmisc` labeling functions
* To reduce the size of the package, the main vignette has been shortened.  The full
version is available at <https://www.mosaic-web.org/ggformula/>.
* Two other vignettes have been moved to online only for the same reason.

# ggformula 0.9.4

* internal updates precipated by changes to ggplot2.

# ggformula 0.9.3

* add `gf_sina()`. (#134)
* update exampels involving `sf::st_as_sf()` to reflect updated names of in the resulting data frame. This is required to get CRAN builds to work without an error. (#137)
* Add helpful error message if dist is not a string in `gf_dist()`. (#133)

# ggformula 0.9.2 

 * Some internals in `layer_factory()` have been reimplemented to avoid making copies of ggplot2 functions at compile time. This should make things more stable when updating ggplot2 but not updating ggformula.
 * Two new graphing functions were added: `gf_ellipse()` and `gf_ecdf()`
 * `gf_rugx()` and `gf_label()` have been modified a bit to make them easier to use.
 * Evaluation environments are now handled more stably.  Instead of using the environment
 of the formula, the `environment` argument is used.  After some delay, this completes
 the migration to ggplot2 version 2.2 (#96, #125)
 * Bug fix in `gf_dist()` to avoid an error when using `params`. (#119)
 * Default in `gf_errorbar()` is now `inherit = TRUE`.  The old default was required
 due to inconvenient naming of aesthetics in `geom_errorbar()`, but those names have been
 changed now. (#120)
 * New function: `discrete_breaks()`.
 
# ggformula 0.9.1

This release includes a few minor improvements, including

 * Updated examples so they work better with pkgdown
 * Other document improvements

# ggformula 0.9.0

 * `ggformula` now requires `ggplot2 (>= 3.0.0)`.  This should take care of issues in 0.8.0 when `ggplot2` was upgraded *after* upgrading `ggformula`.
 * `pkgdown` website created at https://www.mosaic-web.org/ggformula/
 * Several horizontal versions of geom and stats are implemented using `ggstance`.
 * `vdiffr` is used for testing plot output
 

# ggformula 0.8.0

 * The internals of all of the `gf_` functions have been modified to make them
 work with `ggplot2` version 2.3. In future releases, a version `ggplot2` at
 least this new will be required.
 
 * The default value for `se` in `gf_smooth()` has been changed from `TRUE` to `FALSE`.  
 
 * `gf_sf()` added to support simple features data for maps.
 
 * improved documentation and examples
 
# ggformula 0.7.0

 * Formulas of the shape `y ~ .` can be used for plots that require a `y` aesthetic 
   but no `x` aesthetic.
 * Added `gf_rugx()` and `gf_rugy()`.  Also additional examples using rugs are given in
   the documentation.
 * Added `gf_polygon()` for simple maps.  (Improved mapping capabilities should be coming
   when `ggplot2` hits version 2.3.)
 * Some internals have been reworked to improve the processing of arguments and deciding
   when to display the quick help for plotting functions.
 * Modifications to the environments in which some functions are evaluated.

# ggformula 0.6.2

  * Improved scoping of `gf_` functions makes it easier to work with data in the global environment.
  * New functions `gf_props()` and `gf_percents()` added to simplify creating bar graphs on a proportion or percent scale.
  * New arguments `xlab`, `ylab`, `title`, `subtitle`, and `caption` added to `gf_` functions.  In the case of `gf_props()` and `gf_percents()` these are prepopulated with defaults of "proportion" and "percent" to give nicer labeling of the plot.
  * The use of `weatherData` has been removed since that package is no longer on CRAN
  * Improvements to `gf_abline()`, `gf_hline()`, and `gf_vline()` expand the usable portion of the API.
  * Additional examples for some functions.

# ggformula 0.6.1

Minor update primarily to support vignette data sets moving from `StatisticalModeling` to 
`mosaicModel`.

  * Also added `gf_fitdistr()`.

# ggformula 0.6.0

Mostly minor changes:

  * Improved documentation of gf_ functions.
  * na.warn() is now re-exported.
  * Bug fix in gf_violin().
  * Reformatted quick help messages.


# ggformula 0.5.0

For version 0.5, the internals of `ggformula` have been largely redesigned to allow 
implementation of some new features.  The new version relies much less on string parsing.

  * Some important changes to formula parsing include
    * `attribute:value` and `attribute::expression` are no longer supported within the main formula.
    * In exchange, things like `gf_point(1:10 ~ 1:10)` work, making it simpler to create on the fly plots
      without having to build a data frame first.
    * `y ~ 1` is equivalent to `~ y` in functions that allow the `~ y` formula shape.  Example: `gf_histogram(age ~ 1)` and `gf_histogram( ~ age)` are equivalent
    
  * Some new functions have been added
    * `gf_dist()` can plot distributions
    * `gf_dhistogram()` plots density histograms by default
    * `gf_ash()` creates ASH plots
    
  * `df_stats()` has been improved to handle one-sided formulas better.
  
  * Secondary layers are now able to inherit both data and formula-defined attributes from the primary layer.  Use 
  `inherit = FALSE` if you don't want inheritance.  (A few functions have `inherit = FALSE` as their default because
  it seems unlikely that inheriting will be desireable.)
  
  
  
  
# ggformula 0.4.0

Version 0.4.0 constitutes a stable beta release.  Changes to the API are still possible, but more 
likely future changes will focus on expansion of the suite of functions supplied, changes to
the internal implementation, and improved documentation.

  * Separated `ggformula` from `statisticalModeling`.
  * Added support for many more geoms.
  * Improved parsing of formulas.  This is still a bit clunky since the order of operations in
  R formulas does not match what we would prefer in this package.
  * `data` may now be an expression (like `data = KidsFeet %>% filter(sex == "G")`)
  * Added support for geoms that have different required aesthetics.
  * Added support for functions that allow more than one formula shape.  Example: `gf_histogram()`
  accepts formulas with shape ` ~ x` or `y ~ x`.  This makes it possible to create density 
  histograms with `gf_histogram()`.
  * Parentheses now halt parsing of formulas.  This allows for on-the-fly computations in formulas.  Typically these computed expressions must be within parentheses to avoid formula expansion.
  * Use `::` to indicate mapping aesthetics.  (`:` will autodetect, but only if the value
is the name of a variable in the data set.)  This should be considered experimental.
  * Added wrappers `gf_lims()`, `gf_labs()`, `gf_theme()`, `gf_facet_grid()`, `gf_facet_wrap()`
  * Added `gf_refine()` which can be used to pass by chaining anything that would have been "added" in ``ggplot2`
  * Expanded and improved vignette describing use of the package.
  * Added two tutorials.
  * Added "quick help" for plotting functions.
  * Added `gf_lm()`, which is `gf_smooth()` with `method = "lm"`
  * Added `gf_dens()` which is `gf_line()` with `stat = "density"`.



