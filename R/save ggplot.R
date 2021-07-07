#' Save ggplot to png file to use in report
#' @examples save_CREG(filename = "figure")
#' @param filename A string
#' @description This function saves the last plot that was displayed, in a png file with the dimensions (16 x 10 cm) for easy processing in Word reports. The document is saved, by default, in the working directory.

save_CREG  <- function(filename) {
  ggsave(paste0(filename, ".png"), height = 10, width = 16, units = "cm")
}

