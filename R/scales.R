#' CREG palette with ramped colours
#'
#' @param palette 
#' @param alpha 
#' @param reverse 
#'
#' @return
#' @export
CREG_palette <- function(palette = "default", alpha = 1, reverse = FALSE) {
  pal <- CREGcolours[[palette]]
  if(reverse) {
    pal <- rev(pal)
  }
  return(colorRampPalette(pal, alpha))
}

#' CREG colour palette for ggplot2
#'
#' @param ... 
#' @param palette 
#' @param discrete 
#' @param alpha 
#' @param reverse 
#'
#' @return
#' @export
scale_colour_CREG <- function(..., palette = "default",
                             discrete = TRUE, alpha = 1,
                             reverse = FALSE) {
  if(discrete) {
    discrete_scale("colour", "CREGcolours", palette = CREG_palette(palette, alpha = alpha, reverse = reverse))
  } else {
    scale_color_gradientn(colours = CREG_palette(palette, alpha = alpha, reverse = reverse, ...)(256))
  }
}


#' CREG fill palette for ggplot2
#'
#' @param ... 
#' @param palette 
#' @param discrete 
#' @param alpha 
#' @param reverse 
#'
#' @return
#' @export
scale_fill_dutchmasters <- function(..., palette = "milkmaid",
                                     discrete = TRUE, alpha = 1,
                                     reverse = FALSE) {
  if (discrete) {
    discrete_scale("fill", "dutchmasters", palette=dutchmasters_pal(palette, alpha = alpha, reverse = reverse))
  } else {
    scale_color_gradientn(colours = dutchmasters_pal(palette, alpha = alpha, reverse = reverse, ...)(256))
  }
}