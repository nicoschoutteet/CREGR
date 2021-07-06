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

#' Palette
#'
#' @param ...
#'
#' @return
#' @export

colours_CREG <- function(...) {
  cols <- c(...)
  if (is.null (cols))
    return(colour_vector_CREG)
  colour_vector_CREG[[cols]]
}
