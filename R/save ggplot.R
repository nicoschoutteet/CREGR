#' Title
#'
#' @param filename
#'
#' @return
#' @export

save_CREG  <- function(filename) {
  ggsave(paste0(filename, ".png"), height = 10, width = 16, units = "cm")
}

