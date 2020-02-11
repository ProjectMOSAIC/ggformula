context("layer factory")

mtcars2 <- df_stats(wt ~ cyl, data = mtcars, median_wt = median)

test_that(
  "gf_abline()", {
    vdiffr::expect_doppelganger(
      "gf_abline1",
      gf_point(Sepal.Length ~ Sepal.Width, data = iris) %>%
        gf_abline(intercept = ~3, slope = ~1, color = "red")
    )
    vdiffr::expect_doppelganger(
      "gf_abline2",
      gf_point(Sepal.Length ~ Sepal.Width, data = iris) %>%
        gf_abline(intercept = 1:3, slope = 1, color = c("red", "green", "blue"))
    )
    vdiffr::expect_doppelganger(
      "gf_abline3",
      gf_point(wt ~ hp, size = ~wt, color = ~cyl, data = mtcars) %>%
        gf_abline(slope = ~0, intercept = ~median_wt, color = ~cyl, data = mtcars2)
    )

    vdiffr::expect_doppelganger(
      "gf_abline4",
      gf_point(wt ~ hp, size = ~wt, color = ~cyl, data = mtcars) %>%
        gf_abline(slope = ~ 0, intercept = ~ 3, color = "green")
    )

    vdiffr::expect_doppelganger(
      "gf_abline5",
      gf_point(wt ~ hp, size = ~wt, color = ~cyl, data = mtcars) %>%
        gf_hline(yintercept = ~median_wt, color = ~cyl, data = mtcars2)
    )

    vdiffr::expect_doppelganger(
      "gf_abline6",
      gf_point(mpg ~ hp, color = ~cyl, size = ~wt, data = mtcars) %>%
        gf_abline(color = "red", slope = ~ -0.10, intercept = ~ 35)
    )

    vdiffr::expect_doppelganger(
      "gf_abline7",
      gf_point(mpg ~ hp, color = ~cyl, size = ~wt, data = mtcars) %>%
        gf_abline(
          color = "red", slope = ~slope, intercept = ~intercept,
          data = data.frame(slope = -0.10, intercept = 33:35)
        )
    )
  }
)

test_that(
  "gf_area() & gf_ribbon()", {
    Temps <- mosaicData::Weather %>%
      dplyr::filter(city == "Chicago", year == 2016, month <= 4)
    vdiffr::expect_doppelganger(
      "gf_ribbon1",
      gf_ribbon(low_temp + high_temp ~ date, data = Temps, color = "navy", alpha = 0.3)
    )
    vdiffr::expect_doppelganger(
      "gf_area1",
      gf_area(high_temp ~ date, data = Temps, color = "navy", alpha = 0.3)
    )

    vdiffr::expect_doppelganger(
      "gf_ribbon2",
      gf_ribbon(low_temp + high_temp ~ date, data = mosaicData::Weather, alpha = 0.3) %>%
        gf_facet_grid(city ~ .)
    )
  }
)


test_that(
  "gf_ash()", {
    vdiffr::expect_doppelganger(
      "gf_ash1",
      gf_ash(~Sepal.Length, color = ~Species, data = iris)
    )
    vdiffr::expect_doppelganger(
      "gf_ash2",
      gf_ash(~Sepal.Length, color = ~Species, data = iris, binwidth = 0.3)
    )
    vdiffr::expect_doppelganger(
      "gf_ash3",
      gf_ash(~Sepal.Length, color = ~Species, data = iris, adjust = 2)
    )
  }
)

test_that(
  "gf_sina()", {
    set.seed(1234)
    vdiffr::expect_doppelganger(
      "gf_sina",
      gf_sina(Sepal.Length ~ Species, data = iris)
    )
    vdiffr::expect_doppelganger(
      "gf_sina2",
      gf_sina(Sepal.Length ~ Species, data = iris, color = ~Species)
    )
    vdiffr::expect_doppelganger(
      "gf_sina3",
      midwest %>%
        dplyr::mutate(area = cut_number(area, 5)) %>%
        gf_sina(popdensity ~ area, color = ~area, show.legend = FALSE) %>%
        gf_refine(scale_y_log10())
    )
  }
)


test_that(
  "gf_bar() and gf_col()", {
    vdiffr::expect_doppelganger(
      "gf_bar1",
      gf_bar(~Species, data = iris)
    )
    D <- data.frame(
      group = LETTERS[1:3],
      count = c(20, 25, 18)
    )
    vdiffr::expect_doppelganger(
      "gf_col1",
      gf_col(count ~ group, data = D)
    )
  }
)

test_that(
  "gf_barh() and gf_colh()", {
    vdiffr::expect_doppelganger(
      "gf_barh1",
      gf_barh(Species ~ ., data = iris)
    )
    SomeData <- data.frame(
      group = LETTERS[1:3],
      count = c(20, 25, 18)
    )
    vdiffr::expect_doppelganger(
      "gf_colh1",
      gf_colh(group ~ count, data = SomeData)
    )
  }
)
test_that(
  "gf_bin2d()", {
    vdiffr::expect_doppelganger(
      "gf_bin2d1",
      gf_bin2d(eruptions ~ waiting, data = faithful, bins = 15) %>%
        gf_refine(scale_fill_viridis_c(begin = 0.1, end = 0.9))
    )
  }
)

test_that(
  "gf_contour(), gf_density2d(), and gf_density_2d()", {
    vdiffr::expect_doppelganger(
      "gf_countour1",
      gf_point(eruptions ~ waiting, data = faithful) %>%
        gf_contour(density ~ waiting + eruptions, data = faithfuld)
    )
    vdiffr::expect_doppelganger(
      "gf_density2d2",
      gf_point(eruptions ~ waiting, data = faithful) %>%
        gf_density2d(eruptions ~ waiting, data = faithful)
    )
    vdiffr::expect_doppelganger(
      "gf_density_2d",
      gf_point(eruptions ~ waiting, data = faithful) %>%
        gf_density_2d(eruptions ~ waiting, data = faithful)
    )
  }
)

test_that(
  "gf_boxplot()", {
    vdiffr::expect_doppelganger(
      "gf_boxplot1",
      gf_boxplot(Sepal.Length ~ Species, color = ~Species, data = iris)
    )
    vdiffr::expect_doppelganger(
      "gf_boxplot2",
      # move boxplots away a bit by adjusting dodge
      gf_boxplot(age ~ substance,
                 data = mosaicData::HELPrct, color = ~sex,
                 position = position_dodge(width = 0.9)
      )
    )
    vdiffr::expect_doppelganger(
      "gf_boxplot3",
      gf_boxplot(age ~ substance | sex, data = mosaicData::HELPrct, coef = 5, width = 0.4) %>%
        gf_jitter(width = 0.2, alpha = 0.3, seed = 123)
    )
  }
)


test_that(
  "gf_coefline()", {
    mdl <- lm(Sepal.Length ~ Sepal.Width, data = iris)
    vdiffr::expect_doppelganger(
      "gf_coefline1",
      gf_point(Sepal.Length ~ Sepal.Width, data = iris) %>%
        gf_coefline(coef = coef(mdl))
    )
    vdiffr::expect_doppelganger(
      "gf_coefline2",
      gf_point(Sepal.Length ~ Sepal.Width, data = iris) %>%
        gf_coefline(model = mdl)
    )
  }
)

test_that(
  "gf_contour(), gf_density_2d(), gf_density2d()", {
    vdiffr::expect_doppelganger(
      "gf_contour1",
      gf_density_2d(eruptions ~ waiting, data = faithful, alpha = 0.5, color = "navy") %>%
        gf_contour(density ~ waiting + eruptions, data = faithfuld, bins = 10, color = "red")
    )
    vdiffr::expect_doppelganger(
      "gf_contour2",
      gf_jitter(avg_drinks ~ age,
                data = mosaicData::HELPrct,
                seed = 123,
                color = ~sex, alpha = 0.2, width = 0.4, height = 0.4
      ) %>%
        gf_density_2d()
    )
    vdiffr::expect_doppelganger(
      "gf_contour3",
      gf_jitter(avg_drinks ~ age,
                data = mosaicData::HELPrct,
                seed = 123,
                color = ~sex, alpha = 0.2, width = 0.4, height = 0.4
      ) %>%
        gf_density2d()
    )
  }
)

test_that(
  "gf_countsh(), gf_percentssh(), gf_propssh()", {
    vdiffr::expect_doppelganger(
      "gf_countsh1",
      gf_countsh(~substance, data = mosaicData::HELPrct, fill = ~sex, position = "dodgev")
    )
    vdiffr::expect_doppelganger(
      "gf_countsh2",
      gf_countsh(substance ~ ., data = mosaicData::HELPrct, fill = ~sex, position = "dodgev")
    )
    vdiffr::expect_doppelganger(
      "gf_percentsh1",
      gf_percentsh(~substance, data = mosaicData::HELPrct, fill = ~sex, position = "dodgev")
    )
    vdiffr::expect_doppelganger(
      "gf_percentsh2",
      gf_percentsh(substance ~ ., data = mosaicData::HELPrct, fill = ~sex, position = "dodgev")
    )
    vdiffr::expect_doppelganger(
      "gf_propsh1",
      gf_propsh(~substance, data = mosaicData::HELPrct, fill = ~sex, position = "dodgev")
    )
    vdiffr::expect_doppelganger(
      "gf_propsh2",
      gf_propsh(substance ~ ., data = mosaicData::HELPrct, fill = ~sex, position = "dodgev")
    )
  }
)

test_that(
  "gf__counts(), gf_props(), gf_percents()", {
    vdiffr::expect_doppelganger(
      "gf_counts1",
      gf_counts(~substance, data = mosaicData::HELPrct, fill = ~sex, position = position_dodge())
    )
    vdiffr::expect_doppelganger(
      "gf_props1",
      gf_props(~substance, data = mosaicData::HELPrct, fill = ~sex, position = position_dodge())
    )
    vdiffr::expect_doppelganger(
      "gf_percents1",
      gf_percents(~substance, data = mosaicData::HELPrct, fill = ~sex, position = position_dodge())
    )
  }
)

test_that(
  "gf_crossbar(), gf_errorbar(), gf_pointrange()", {
    HELP2 <- mosaicData::HELPrct %>%
      dplyr::group_by(substance, sex) %>%
      dplyr::summarise(
        mean.age = mean(age),
        median.age = median(age),
        max.age = max(age),
        min.age = min(age),
        sd.age = sd(age),
        lo = mean.age - sd.age,
        hi = mean.age + sd.age
      )

    vdiffr::expect_doppelganger(
      "gf_pointrange2",
      gf_jitter(age ~ substance,
                data = mosaicData::HELPrct, seed = 123,
                alpha = 0.5, width = 0.2, height = 0, color = "skyblue"
      ) %>%
        gf_pointrange(mean.age + lo + hi ~ substance, data = HELP2) %>%
        gf_facet_grid(~sex)
    )
    vdiffr::expect_doppelganger(
      "gf_errorbar1",
      gf_jitter(age ~ substance,
                data = mosaicData::HELPrct, seed = 123,
                alpha = 0.5, width = 0.2, height = 0, color = "skyblue"
      ) %>%
        gf_errorbar(lo + hi ~ substance, data = HELP2, inherit = FALSE) %>%
        gf_facet_grid(~sex)
    )
    vdiffr::expect_doppelganger(
      "gf_crossbar1",
      gf_jitter(age ~ substance,
                data = mosaicData::HELPrct, seed = 123,
                alpha = 0.5, width = 0.2, height = 0, color = "skyblue"
      ) %>%
        gf_boxplot(age ~ substance, data = mosaicData::HELPrct, color = "red") %>%
        gf_crossbar(mean.age + lo + hi ~ substance, data = HELP2) %>%
        gf_facet_grid(~sex)
    )
  }
)

test_that(
  "gf_crossbarh(), gf_errorbarh(), gf_pointrangeh()", {
    HELP2 <- mosaicData::HELPrct %>%
      dplyr::group_by(substance, sex) %>%
      dplyr::summarise(
        mean.age = mean(age),
        median.age = median(age),
        max.age = max(age),
        min.age = min(age),
        sd.age = sd(age),
        lo = mean.age - sd.age,
        hi = mean.age + sd.age
      )

    vdiffr::expect_doppelganger(
      "gf_pointrangeh1",
      gf_jitter(substance ~ age,
                data = mosaicData::HELPrct, seed = 123,
                alpha = 0.5, height = 0.2, width = 0, color = "skyblue"
      ) %>%
        gf_pointrangeh(substance ~ mean.age + lo + hi, data = HELP2) %>%
        gf_facet_grid(sex ~ .)
    )
    vdiffr::expect_doppelganger(
      "gf_errorbarh1",
      gf_jitter(substance ~ age,
                data = mosaicData::HELPrct, seed = 123,
                alpha = 0.5, height = 0.2, width = 0, color = "skyblue"
      ) %>%
        gf_errorbarh(substance ~ lo + hi, data = HELP2, inherit = FALSE) %>%
        gf_facet_grid(sex ~ .)
    )
    vdiffr::expect_doppelganger(
      "gf_crossbarh1",
      gf_jitter(substance ~ age,
                data = mosaicData::HELPrct, seed = 123,
                alpha = 0.5, height = 0.2, width = 0, color = "skyblue"
      ) %>%
        gf_crossbarh(substance ~ mean.age + lo + hi, data = HELP2) %>%
        gf_facet_grid(sex ~ .)
    )
  }
)


test_that(
  "gf_curve() and gf_segment()", {
    SomeData <- data.frame(x1 = 2.62, x2 = 3.57, y1 = 21.0, y2 = 15.0)
    vdiffr::expect_doppelganger(
      "gf_curve_segment1",
      gf_point(mpg ~ wt, data = mtcars) %>%
        gf_curve(y1 + y2 ~ x1 + x2, data = SomeData, color = "navy") %>%
        gf_segment(y1 + y2 ~ x1 + x2, data = SomeData, color = "red")
    )
  }
)

test_that(
  "gf_dens() and gf_density", {
    vdiffr::expect_doppelganger(
      "gf_dens1",
      gf_dens(~Sepal.Length, data = iris)
    )
    vdiffr::expect_doppelganger(
      "gf_dens2",
      gf_dens(~Sepal.Length, data = iris, color = ~Species)
    )
    vdiffr::expect_doppelganger(
      "gf_density1",
      gf_density(~Sepal.Length, fill = ~Species, data = iris, alpha = 0.5)
    )
    vdiffr::expect_doppelganger(
      "gf_density2",
      gf_density(~ Sepal.Length | Species ~ ., fill = ~Species, data = iris, alpha = 0.5)
    )
  }
)
test_that(
  "gf_dist()", {
    vdiffr::expect_doppelganger(
      "gf_dist1",
      gf_dist("norm", mean = 10, sd = 2)
    )
    vdiffr::expect_doppelganger(
      "gf_dist2",
      gf_dist("norm", fill = ~ (abs(x) <= 2), geom = "area")
    )
    vdiffr::expect_doppelganger(
      "gf_dist3",
      gf_dist("norm", fill = "red", kind = "histogram")
    )
    vdiffr::expect_doppelganger(
      "gf_dist4",
      gf_dist("norm", color = "red", kind = "qqstep", resolution = 25) %>%
        gf_dist("norm", color = "black", kind = "qq", resolution = 25, size = 2, alpha = 0.5)
    )
    vdiffr::expect_doppelganger(
      "gf_dist5",
      gf_dist("binom", size = 20, prob = 0.25, plot_size = 2)
    )
    vdiffr::expect_doppelganger(
      "gf_dist6",
      gf_dist("binom", params = list(size = 20, prob = 0.25), size = 2)
    )
  }
)

test_that(
  "gf_dotplot()", {
    vdiffr::expect_doppelganger(
      "gf_dotplot1",
      gf_dotplot(~Sepal.Length, fill = ~Species, data = iris, binwidth = 0.2) %>%
        gf_labs(title = "dotdensity")
    )
    vdiffr::expect_doppelganger(
      "gf_dotplot2",
      gf_dotplot(~Sepal.Length,
                 fill = ~Species, data = iris,
                 binwidth = 0.2, method = "histodot"
      ) %>%
        gf_labs(title = "histodot")
    )
  }
)

test_that(
  "gf_empty(), gf_blank(), and gf_frame()", {
    vdiffr::expect_doppelganger(
      "gf_empty1",
      gf_empty() %>%
        gf_labs(title = "empty")
    )
    vdiffr::expect_doppelganger(
      "gf_empty2",
      gf_empty() %>%
        gf_point(Sepal.Length ~ Sepal.Width, data = iris, color = ~Species) %>%
        gf_labs(title = "empty + point")
    )
    vdiffr::expect_doppelganger(
      "gf_frame1",
      gf_frame(c(0, 10) ~ c(0, 5)) %>%
        gf_labs(title = "frame")
    )
    vdiffr::expect_doppelganger(
      "gf_blank1",
      gf_point((c(0, 1)) ~ (c(0, 5))) %>%
        gf_blank((c(0, 3)) ~ (c(-2, 7)))
    )
  }
)

test_that(
  "gf_fitdistr()", {
    set.seed(12345)
    Dat <- data.frame(g = rgamma(500, 3, 10), f = rf(500, df1 = 3, df2 = 47))
    vdiffr::expect_doppelganger(
      "gf_fitdistr1",
      gf_fitdistr(~length, data = mosaicData::KidsFeet, inherit = FALSE) %>%
        gf_dhistogram(~length,
                      data = mosaicData::KidsFeet, binwidth = 0.5,
                      alpha = 0.25
        )
    )
    vdiffr::expect_doppelganger(
      "gf_fitdistr2",
      gf_dhistogram(~g, data = Dat) %>%
        gf_fitdistr(dist = "dgamma")
    )
  }
)

test_that(
  "gf_freqpoly()", {
    vdiffr::expect_doppelganger(
      "gf_freqpoly1",
      gf_freqpoly(~Sepal.Length, color = ~Species, data = iris)
    )
    vdiffr::expect_doppelganger(
      "gf_freqpoly2",
      gf_freqpoly(~Sepal.Length,
                  color = ~Species, data = iris,
                  binwidth = 0.5
      )
    )
  }
)

test_that(
  "gf_freqpoly()", {
    vdiffr::expect_doppelganger(
      "gf_fun1",
      gf_fun(sin(x) ~ x, color = ~"sin", xlim = pi * c(-2, 2)) %>%
        gf_fun(cos(x) ~ x, color = ~"cosine", xlim = pi * c(-2, 2))
    )
    vdiffr::expect_doppelganger(
      "gf_fun2",
      gf_point(length ~ width, data = mosaicData::KidsFeet) %>%
        gf_fun(4 * cos(5 * x) + 24 ~ x, color = ~"cosine", xlim = pi * c(-2, 2)) %>%
        gf_labs(color = "")
    )
  }
)

test_that(
  "gf_fun2d()", {
    vdiffr::expect_doppelganger(
      "gf_fun2d1",
      gf_function_2d(fun = function(x, y) sin(2 * x * y), xlim = c(-pi, pi), ylim = c(-pi, pi)) %>%
        gf_refine(scale_fill_viridis_c())
    )
    vdiffr::expect_doppelganger(
      "gf_fun2d2",
      gf_function_2d(fun = function(x, y) x + y, contour = FALSE)
    )
    vdiffr::expect_doppelganger(
      "gf_fun2d3",
      gf_function_tile(fun = function(x, y) x * y) %>%
        gf_function_contour(fun = function(x, y) x * y, color = "white") %>%
        gf_refine(scale_fill_viridis_c())
    )
    vdiffr::expect_doppelganger(
      "gf_fun2d4",
      gf_fun_tile(x * y ~ x + y, xlim = c(-3, 3), ylim = c(-2, 2)) %>%
        gf_fun_contour(x * y ~ x + y, color = "white") %>%
        gf_refine(scale_fill_viridis_c()) %>%
        gf_labs(fill = "product")
    )
    vdiffr::expect_doppelganger(
      "gf_fun2d5",
      gf_fun(sin(x) ~ x, color = ~"sin", xlim = pi * c(-2, 2)) %>%
        gf_fun(cos(x) ~ x, color = ~"cosine", xlim = pi * c(-2, 2))
    )
    vdiffr::expect_doppelganger(
      "gf_fun2d6",
      gf_point(length ~ width, data = mosaicData::KidsFeet) %>%
        gf_fun(4 * cos(5 * x) + 24 ~ x, color = ~"cosine", xlim = pi * c(-2, 2)) %>%
        gf_labs(color = "")
    )
  }
)


test_that(
  "gf_hex()", {
    vdiffr::expect_doppelganger(
      "gf_hex1",
      gf_hex(avg_drinks ~ age, data = mosaicData::HELPrct, bins = 15) %>%
        gf_density2d(avg_drinks ~ age,
                     data = mosaicData::HELPrct,
                     color = "yellow", alpha = 0.5
        )
    )
  }
)



test_that(
  "gf_histogram() and gf_dhistogram", {
    vdiffr::expect_doppelganger(
      "gf_histogram1",
      gf_histogram(~Sepal.Length, data = iris)
    )
    vdiffr::expect_doppelganger(
      "gf_histogram2",
      gf_histogram(~ Sepal.Length | Species ~ .,
                   fill = ~Species, data = iris, alpha = 0.5,
                   binwidth = 0.25
      )
    )
    vdiffr::expect_doppelganger(
      "gf_dhistogram1",
      gf_dhistogram(~Sepal.Length, data = iris)
    )
    vdiffr::expect_doppelganger(
      "gf_dhistogramh1",
      gf_dhistogramh(Sepal.Length ~ ., data = iris)
    )
    vdiffr::expect_doppelganger(
      "gf_dhistogramh2",
      gf_dhistogramh(Sepal.Length ~ stat(ndensity), data = iris)
    )
  }
)

test_that(
  "gf_line()", {
    vdiffr::expect_doppelganger(
      "gf_line1",
      gf_line(births ~ date, data = mosaicData::Births78)
    )
    vdiffr::expect_doppelganger(
      "gf_line2",
      gf_line(births ~ date, color = ~wday, data = mosaicData::Births78)
    )
  }
)

test_that(
  "gf_label() and gf_text()", {
    vdiffr::expect_doppelganger(
      "gf_label1",
      gf_label(width ~ length, data = mosaicData::KidsFeet, label = ~name)
    )
    vdiffr::expect_doppelganger(
      "gf_label2",
      gf_label(width ~ length, data = mosaicData::KidsFeet, label = ~name,
               nudge_x = 0.1, nudge_y = -0.05, color = ~ sex) %>%
        gf_point()
    )
    vdiffr::expect_doppelganger(
      "gf_text1",
      gf_text(width ~ length, data = mosaicData::KidsFeet, label = ~name)
    )
    vdiffr::expect_doppelganger(
      "gf_text2",
      gf_text(width ~ length, data = mosaicData::KidsFeet, label = ~name,
              color = ~ sex, nudge_x = 0.1, nudge_y = -0.05) %>%
        gf_point()
    )
  }
)

test_that(
  "gf_linerange() and gf_pointrange()", {
    vdiffr::expect_doppelganger(
      "gf_linerange1",
      gf_linerange(low_temp + high_temp ~ date,
                   data = mosaicData::Weather, color = ~avg_temp
      ) %>%
        gf_facet_grid(city ~ year, scale = "free") %>%
        gf_refine(scale_color_viridis_c(option = "C", begin = 0.1, end = 0.8))
    )
    vdiffr::expect_doppelganger(
      "gf_pointrange1",
      gf_pointrange(avg_temp + low_temp + high_temp ~ date,
                    data = mosaicData::Weather %>% head(200),
                    color = ~avg_temp
      ) %>%
        gf_facet_grid(city ~ year, scale = "free") %>%
        gf_refine(scale_color_viridis_c(option = "C", begin = 0.1, end = 0.8))
    )
  }
)

test_that(
  "gf_point()", {
    vdiffr::expect_doppelganger(
      "gf_point1",
      gf_point(Sepal.Length ~ Sepal.Width, data = iris)
    )
    vdiffr::expect_doppelganger(
      "gf_point2",
      gf_point(Sepal.Length ~ Sepal.Width | Species, color = ~Species, data = iris)
    )
  }
)

test_that(
  "gf_qq(), gf_qqstep(), gf_qqline()", {
    vdiffr::expect_doppelganger(
      "gf_qq1",
      gf_qq(~ age | substance, data = mosaicData::HELPrct) %>%
        gf_qqline()
    )
    vdiffr::expect_doppelganger(
      "gf_qqstep1",
      gf_qqstep(~ age | substance, data = mosaicData::HELPrct) %>%
        gf_qqline()
    )
  }
)



test_that(
  "gf_quantile()", {
    vdiffr::expect_doppelganger(
      "gf_quantile",
      gf_point((1 / hwy) ~ displ, data = mpg) %>%
        gf_quantile((1 / hwy) ~ displ, quantiles = 0.5, color = "red") %>%
        gf_quantile((1 / hwy) ~ displ, quantiles = c(0.2, 0.8))
    )
  }
)


test_that(
  "gf_raster(), gf_tile(), gf_density2d()", {
    vdiffr::expect_doppelganger(
      "gf_raster1",
      gf_raster(density ~ eruptions + waiting, data = faithfuld)
    )
    vdiffr::expect_doppelganger(
      "gf_tile1",
      gf_tile(density ~ eruptions + waiting, data = faithfuld) %>%
        gf_contour(density ~ eruptions + waiting, color = "yellow") %>%
        gf_refine(scale_fill_viridis_c(begin = 0.2))
    )
    vdiffr::expect_doppelganger(
      "gf_density2d1",
      gf_density2d(eruptions ~ waiting, data = faithful)
    )
  }
)

test_that(
  "gf_rect()", {
    vdiffr::expect_doppelganger(
      "gf_rect1",
      gf_rect(1.5 + 3 ~ 40 + 68, fill = "red", alpha = 0.2) %>%
        gf_rect(3 + 5.5 ~ 68 + 100, fill = "green", alpha = 0.2) %>%
        gf_point(eruptions ~ waiting, data = faithful)
    )
  }
)

test_that(
  "gf_rect()", {
    set.seed(1234)
    SomeData <- expand.grid(x = 1:10, y = 1:10)
    SomeData$angle <- runif(100, 0, 2 * pi)
    SomeData$speed <- runif(100, 0, sqrt(0.1 * SomeData$x))

    vdiffr::expect_doppelganger(
      "gf_spoke1",
      gf_point(y ~ x, data = SomeData) %>%
        gf_spoke(y ~ x, angle = ~angle, radius = 0.5)
    )

    vdiffr::expect_doppelganger(
      "gf_spoke2",
      gf_point(y ~ x, data = SomeData) %>%
        gf_spoke(y ~ x, angle = ~angle, radius = ~speed)
    )
  }
)

test_that(
  "gf_rug(), etc.", {
    set.seed(1234)
    vdiffr::expect_doppelganger(
      "gf_rugx()/gf_rug_y() #1",
      gf_point(Sepal.Length ~ Sepal.Width, data = iris) %>%
        gf_rugx(~Sepal.Width, data = iris, color = "red") %>%
        gf_rugy(Sepal.Length ~ ., data = iris, color = "green")
    )
    vdiffr::expect_doppelganger(
      "gf_rugx()/gf_rug_y() with jitter",
      gf_jitter(Sepal.Length ~ Sepal.Width, data = iris, seed = 123) %>%
        gf_rugx(~Sepal.Width, data = iris, color = "red", position = "jitter", seed = 123) %>%
        gf_rugy(Sepal.Length ~ ., data = iris, color = "green", position = "jitter", seed = 123)
    )
    vdiffr::expect_doppelganger(
      "gf_rugx()",
      gf_dhistogram( ~ Sepal.Length, data = iris) %>%
        gf_rugx(position = "jitter", alpha = 0.4, color = "red", seed = 123)
    )
    vdiffr::expect_doppelganger(
      "gf_rugy()",
      gf_dhistogramh( Sepal.Length ~ ., data = iris) %>%
        gf_rugy(position = "jitter", alpha = 0.4, color = "navy", seed = 123)
    )

###
    vdiffr::expect_doppelganger(
      "gf_rug() #1",
      gf_point(Sepal.Length ~ Sepal.Width, data = iris) %>%
        gf_rug(. ~ Sepal.Width, data = iris, color = "red", inherit = FALSE) %>%
        gf_rug(Sepal.Length ~ ., data = iris, color = "green", inherit = FALSE)
    )
    vdiffr::expect_doppelganger(
      "gf_rug() #2",
      gf_point(Sepal.Length ~ Sepal.Width, data = iris) %>%
        gf_rug(. ~ Sepal.Width, data = iris, color = "red", sides = "b") %>%
        gf_rug(Sepal.Length ~ ., data = iris, color = "green", sides = "l")
    )
    # jitter requires both an x and a y, but we can turn off one or the other with sides
    vdiffr::expect_doppelganger(
      "gf_rug() #3",
      gf_jitter(Sepal.Length ~ Sepal.Width, data = iris) %>%
        gf_rug(color = "green", sides = "b", position = "jitter", seed = 123)
    )
    # rugs work with some 1-varialbe plots as well.
    vdiffr::expect_doppelganger(
      "gf_rug #4",
      gf_histogram(~eruptions, data = faithful) %>%
        gf_rug(~eruptions, data = faithful, color = "red") %>%
        gf_rug(~eruptions, data = faithful, color = "navy", sides = "t")
    )
    # we can take advantage of inheritance to shorten the code
    vdiffr::expect_doppelganger(
      "gf_rug #5",
      gf_histogram(~eruptions, data = faithful) %>%
        gf_rug(color = "red") %>%
        gf_rug(color = "navy", sides = "t")
    )
    # Need to turn off inheritance when using gf_dhistogram:
    vdiffr::expect_doppelganger(
      "gf_rug() #6",
      gf_dhistogram(~eruptions, data = faithful) %>%
        gf_rug(~eruptions, data = faithful, color = "red", inherit = FALSE)
    )
    # using jitter with gf_histogram() requires manually setting the y value.
    vdiffr::expect_doppelganger(
      "gf_rug() #7",
      gf_dhistogram(~Sepal.Width, data = iris) %>%
        gf_rug(0 ~ Sepal.Width, data = iris, color = "green", sides = "b",
               position = "jitter", seed = 123)
    )
    # the choice of y value can affect how the plot looks.
    vdiffr::expect_doppelganger(
      "gf_rug() #8",
      gf_dhistogram(~Sepal.Width, data = iris) %>%
        gf_rug(0.5 ~ Sepal.Width, data = iris, color = "green", sides = "b",
               position = "jitter", seed = 123)
    )
  }
)

test_that(
  "discrete_breaks()", {
    vdiffr::expect_doppelganger(
      "discrete_breaks -- default",
      gf_histogram( ~ Sepal.Length, data = iris) %>%
        gf_refine(scale_x_continuous(breaks = discrete_breaks()))
    )
    vdiffr::expect_doppelganger(
      "discrete_breaks -- 0.5",
      gf_histogram( ~ Sepal.Length, data = iris) %>%
        gf_refine(scale_x_continuous(breaks = discrete_breaks(0.5)))
    )
  }
)

