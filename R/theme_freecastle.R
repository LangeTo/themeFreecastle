if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

theme_freecastle <- function(axis_lines = TRUE,
                             grid_lines = FALSE,
                             strip_background = TRUE,
                             line_size = 1,
                             base_family = "sans") {
  # start from modifying theme_minimal
  th <- ggplot2::theme_minimal()

  # remove grid lines
  th <- th + theme(panel.grid = element_blank())

  # more space for axis text/title and plot title
  th <- th + theme(
    # axis settings
    axis.text = element_text(color = "black"),
    axis.title.x = element_text(margin = margin(t = 10), size = rel(0.9)),
    axis.text.x = element_text(margin = margin(t = 5)),
    axis.title.y = element_text(margin = margin(r = 10), size = rel(0.9)),
    axis.text.y = element_text(margin = margin(r = 5)),
    # title settings
    plot.title = element_text(margin = margin(b = 10), size = rel(0.9)),
    plot.subtitle = element_text(margin = margin(b = 10), size = rel(0.9)),
    # legend settings
    legend.position = "top",
    legend.justification = "center",
    legend.title = element_text(margin = margin(b = 10), size = rel(0.9)),
    # adjust plot margins for larger plot area
    plot.margin = margin(t = 0, r = 0, b = 0, l = 0, unit = "cm")
  )

  # adjustable part
  # axis lines
  if (axis_lines) {
    # We add axis lines and give them our preferred thickness
    th <- th +
      theme(
        axis.line = element_line(linewidth = line_size),
        axis.ticks = element_line(linewidth = line_size)
      )
  }

  # major grid lines
  if (grid_lines) {
    th <- th +
      theme(panel.grid.major = element_line(linewidth = 0.2, color = "grey"))
  }

  # if background for facet_wrap and facet_zoom is desired
  if (strip_background) {
    th <- th +
      theme(
        strip.background = element_rect(
          fill = "grey90",
          color = "grey80",
          linewidth = 1,
          linetype = "dashed"
        )
      )
  }
  return(th)
}
