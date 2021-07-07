# ggplot theme ------------------------------------------------------------
# either call explicitly in ggplot, via + theme_CREG()
# or set at beginning of each session via theme_set(theme_CREG)

#' CREG_theme()
#'
#' @return
#' @export

theme_CREG <- function() {
  theme_classic() %+replace%
    theme(plot.title = element_text(size = 10, hjust = 0, colour = colours_CREG("blue1")),
          plot.subtitle = element_text(size = 8, hjust = 0, margin = margin(0, 0, .5, 0, "cm")),
          plot.title.position = "plot",
          plot.caption = element_text(hjust = 0 , size = 5),
          plot.caption.position = "plot",
          legend.position = "none",
          legend.title = element_text(size = 8, face = "bold"),
          legend.text = element_text(size = 8),
          axis.title = element_text(size = 8),
          axis.text = element_text(size = 8),
          panel.grid.major = element_line(size = .25, color = "grey", linetype = "dotted"))
}
