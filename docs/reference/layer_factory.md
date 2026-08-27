# Create a ggformula layer function

Primarily intended for package developers, this function factory is used
to create the layer functions in the ggformula package.

## Usage

``` r
layer_factory(
  geom = "point",
  position = "identity",
  stat = "identity",
  interactive = FALSE,
  layer_func_interactive = "geom_point",
  pre = {
 },
  aes_form = y ~ x,
  extras = alist(),
  note = NULL,
  aesthetics = aes(),
  inherit.aes = TRUE,
  check.aes = TRUE,
  data = NULL,
  required_packages = character(0),
  installed_packages = character(0),
  layer_fun = if (interactive) {
     quo(layer_interactive)
 } else {
    
    quo(ggplot2::layer)
 },
  ...
)
```

## Arguments

- geom:

  The geom to use for the layer (may be specified as a string).

- position:

  The position function to use for the layer (may be specified as a
  string).

- stat:

  The stat function to use for the layer (may be specified as a string).

- interactive:

  A logical indicating whether this is being used to create an
  interactive layer.

- layer_func_interactive:

  The function used to create the layer when \`interactive“ is TRUE (or
  a quosure that evaluates to such a function).

- pre:

  code to run as a "pre-process".

- aes_form:

  A single formula or a list of formulas specifying how attributes are
  inferred from the formula. Use `NULL` if the function may be used
  without a formula.

- extras:

  An alist of additional arguments (potentially with defaults)

- note:

  A note to add to the quick help.

- aesthetics:

  Additional aesthetics (typically created using
  [`ggplot2::aes()`](https://ggplot2.tidyverse.org/reference/aes.html))
  set rather than inferred from formula.
  [`gf_dhistogram()`](gf_histogram.md) uses this to set the y aesthetic
  to `stat(density)`, for example.

- inherit.aes:

  A logical indicating whether aesthetics should be inherited from prior
  layers or a vector of character names of aesthetics to inherit.

- check.aes:

  A logical indicating whether a warning should be emited when
  aesthetics provided don't match what is expected.

- data:

  A data frame or `NULL` or `NA`.

- required_packages:

  A character vector naming packages that must be both installed and
  attached (via [`library()`](https://rdrr.io/r/base/library.html)) for
  the resulting function to work – typically because `geom`/`stat` are
  given as strings that must be resolved against an attached package's
  namespace (see the "Extending ggformula" vignette). Each named package
  is checked before `pre` runs, and an informative error is raised if a
  package is missing or not attached. Use `character(0)` (the default)
  if there are no such requirements, or if a `layer_fun` is used that
  calls the extension package's own function directly (in which case the
  package usually only needs to be installed, not attached, in which
  case `installed_packages` is the better fit).

- installed_packages:

  A character vector naming packages that must be installed (but need
  not be attached via
  [`library()`](https://rdrr.io/r/base/library.html)) for the resulting
  function to work – typically because `layer_fun` calls the extension
  package's own function directly (e.g. via `pkg::fun()`), which doesn't
  require the package to be attached. Each named package is checked
  before `pre` runs (alongside `required_packages`), and an informative
  error is raised if a package is missing. Use `character(0)` (the
  default) if there is no such requirement.

- layer_fun:

  function used to create a layer. The default value is anticipated to
  work in most (all?) cases.

- ...:

  Additional arguments.

## Value

A function.
