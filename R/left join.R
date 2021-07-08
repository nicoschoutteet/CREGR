#' Left join csv files which were extracted from DWH
#' @description This function left joints a csv file to another csv.
#' The arguments include a reference to a subfolder of the working directory(filepath), a reference to the csv file (filename),
#' and an indication of the type of column (in abbreviate form, e.g. "n" = numeric, "d" = double, "c" = character).
#' @param subfoler A string, including the subfolder where the csv file is stored
#' @param filename A string, including the name of the csv file (don't include the extension ".csv" as this is added automatically)
#' @param col_types A string describing, in short form, the column types of the data itself (i.e. not the year, month, day, etc. variables as those are added automatically)
#' @examples df <- loadcsv_CREG(filepath = "source data", filename = "loadBE", col_types = "n") %>%
#' left_join(filepath = "source data", filename = "loadNL", col_types = "n")
#' @export

leftjoin_CREG <- function(subfolder, filename, col_types) {
  left_join(select(loadCSV_CREG(subfolder, filename, col_types),
            DateTime, last_col(1:nchar(col_types)),
            by = c("DateTime" = "DateTime"),
            keep = FALSE))
}
