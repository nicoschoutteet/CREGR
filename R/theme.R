#' Apply custom CREG theme to ggplot visuals
#' @examples ggplot(data = mpg) +
#' geom_point(mapping = aes(x = displ, y = hwy)) +
#' theme_CREG()
#' @description This function applies a custom theme, based on the CREG Style Guide, for the lay-out and colors of ggplot visuals. The colors are based on the CREG pallete, defined in the colours_CREG() function.
#' @return
#' @export

theme_CREG <- function() {
  theme_classic() %+replace%
    theme(plot.title = element_text(size = 10, hjust = 0, colour = colour_CREG_function("blue1")),
          plot.subtitle = element_text(size = 8, hjust = 0, margin = margin(0, 0, .5, 0, "cm")),
          plot.title.position = "plot",
          plot.caption = element_text(hjust = 0 , size = 5),
          plot.caption.position = "plot",
          plot.margin = margin(0, 0, 0, 0, "cm"),
          legend.position = "none",
          legend.title = element_text(size = 8, face = "bold"),
          legend.text = element_text(size = 8),
          axis.title = element_text(size = 8),
          axis.text = element_text(size = 8),
          panel.grid.major = element_line(size = .25, color = "grey", linetype = "dotted"))
}
