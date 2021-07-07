# Color palette ------------------------------------------------------------

colour_vector_CREG <- c(
  "blue1" = "#00B0B9",
  "blue2" = "#005F83",
  "blue3" = "#002D72",
  "blue4" = "#00A9E0",
  "purple" = "???485CC7",
  "green" = "#78D64B",
  "yellow" = "#EFDF00",
  "orange" = "#FF8200",
  "pink" = "#FB637E",
  "red" = "#C5003E",
  "grey1" = "#C8C9C7",
  "grey2" = "#75787B",
  "black" = "#111111"
)

#' Colour picker
#'
#' @param ...
#'
#' @return
#' @export

colour_CREG <- function(...) {
  cols <- c(...)
  if (is.null (cols))
    return(colour_vector_CREG)
  colour_vector_CREG[cols]
}

palette_CREG <- list(
  `countries` = colour_CREG("blue2", "red", "orange", "green", "yellow"),
  `main` = colour_CREG("blue2", "red", "orange", "green", "yellow", "pink", "purple"),
  `blue` = colour_CREG("blue2", "blue3", "grey1", "grey2")
)

#' Colour palette
#' @description This function defines colour palettes for ggplot objects.
#'
#' @param palette A string (possibilities are: "countries", "main", "blue")
#' @param reverse Logical, define whether the colours need to be applied in reverse order (default = FALSE)
#' @param ... other
colour_palette_CREG <- function(palette = "main", reverse = FALSE, ...) {
  pal <- palette_CREG[[palette]]
  if (reverse) pal <- rev(pal)
  colorRampPalette(pal, ...)
}

getwd()
