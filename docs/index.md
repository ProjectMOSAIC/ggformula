# ggformula

## Formula interface to ggplot2

`ggformula` introduces a family of graphics functions,
[`gf_point()`](reference/gf_point.md),
[`gf_density()`](reference/gf_density.md), and so on, bring the formula
interface to
[`ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html). This
captures and extends the excellent simplicity of the `lattice`-graphics
formula interface, while providing the intuitive “add this component”
capabilities of `ggplot2`.

## Installation

You can install ggformula from CRAN sith

\
[`install.packages`](https://rdrr.io/r/utils/install.packages.html)`(``"ggformula"``)`

or from github with:

\
`# install.packages("devtools")`\
`devtools``::`[`install_github`](https://devtools.r-lib.org/reference/install-deprecated.html)`(``"ProjectMOSAIC/ggformula"``)`

## Using ggformula

The following example illustrates a typical plot constructed with
ggformula.

\
[`suppressPackageStartupMessages`](https://rdrr.io/r/base/message.html)`(`[`library`](https://rdrr.io/r/base/library.html)`(`[`ggformula`](https://github.com/ProjectMOSAIC/ggformula)`)``)`\
[`data`](https://rdrr.io/r/utils/data.html)`(``penguins``, package ``=`` ``"palmerpenguins"``)`\
`penguins`` ``|>`` `\
`  ``tidyr``::`[`drop_na`](https://tidyr.tidyverse.org/reference/drop_na.html)`(``)`` ``|>`` ``# to avoid erros with default bandwidth calculation in stat_density_2d`\
`  `[`set_variable_labels`](https://larmarange.github.io/labelled/reference/var_label.html)`(`\
`    bill_length_mm ``=`` ``"bill length (mm)"``,`\
`    bill_depth_mm ``=`` ``"bill depth (mm)"`\
`  ``)`` ``|>`\
`  `[`gf_jitter`](reference/gf_jitter.md)`(``bill_length_mm`` ``~`` ``bill_depth_mm`` ``|`` ``island`` ``~`` ``sex``, color ``=`` ``~`` ``species``,`\
`          width ``=`` ``0.05``, height ``=`` ``0.05``, size ``=`` ``0.5``, alpha ``=`` ``0.6``)`` ``|>`\
`  `[`gf_density2d`](reference/gf_density_2d.md)`(``alpha ``=`` ``0.3``)`` ``|>`\
`  `[`gf_labs`](reference/gf_aux.md)`(``title ``=`` ``"Palmer Penguins"``,`\
`          caption ``=`` ``"Data available in palmerpenguins package"`\
`  ``)`` ``|>`\
`  `[`gf_refine`](reference/gf_aux.md)`(`[`scale_color_brewer`](https://ggplot2.tidyverse.org/reference/scale_brewer.html)`(``type ``=`` ``"qual"``)``)`` ``|>`\
`  `[`gf_theme`](reference/gf_theme.md)`(`[`theme_bw`](https://ggplot2.tidyverse.org/reference/ggtheme.html)`(``)``)`` ``|>`\
`  `[`gf_theme`](reference/gf_theme.md)`(`\
`    legend.position ``=`` ``'top'``,`\
`    text ``=`` `[`element_text`](https://ggplot2.tidyverse.org/reference/element.html)`(``colour ``=`` ``"navy"``, face ``=`` ``"italic"``)`\
`  ``)`

![](README-example-1.png)

### More Information

Find out more about `ggformula` at
<https://www.mosaic-web.org/ggformula/>.
