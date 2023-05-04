if(!require(ggplot2)){
  install.packages("ggplot2")
  library(ggplot2)
}

theme_freecastle <- function(axis_lines = TRUE,
                         grid_lines = FALSE,
                         text_size = 12,
                         line_size = 0.5,
                         # replace with 'sans' if not working
                         base_family= 'sans'){

  # start with theme_minimal because it is really simple.
  th <- ggplot2::theme_minimal(base_family = base_family,
                               base_size = text_size)

  # remove the grid lines
  th <- th + theme(panel.grid=element_blank())

  # if we want axis lines
  if (axis_lines) {
    # We add axis lines and give them our preferred thickness
    th <- th +
      theme(axis.line = element_line(size = line_size),
            axis.ticks = element_line(size = line_size))
  }
  # do we want grid lines?
  if (grid_lines) {
    th <- th +
      theme(panel.grid.major = element_line(size = 0.2))
  }

  # more space for axis text/title and plot title
  th <- th + theme(
    axis.text.x=element_text(margin=margin(t=5)),
    axis.text.y=element_text(margin=margin(r=5)),
    axis.title.x=element_text(margin=margin(t=10)),
    axis.title.y=element_text(margin=margin(r=10)),
    plot.title=element_text(margin=margin(b=10)),
    legend.justification = "top",
    legend.title = element_text(face = "bold"))

  return (th)
}
