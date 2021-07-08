#' Import csv files which were extracted from DWH
#' @description This function imports a csv file into an R session.
#' The arguments include a reference to a subfolder of the working directory(filepath), a reference to the csv file (filename),
#' and an indication of the type of column (in abbreviate form, e.g. "n" = numeric, "d" = double, "c" = character).
#' @param subfoler A string, including the subfolder where the csv file is stored
#' @param filename A stringn, including the name of hte csv file (don't include the extension ".csv" as this is added automatically)
#' @param col_types A string describing, in short form, the column types of the data itself (i.e. not the year, month, day, etc. variables as those are added automatically)
#' @examples df <- loadcsv_CREG(filepath = "source data", filename = "loadBE", col_types = "n")
#' @export

loadcsv_CREG <- function(subfolder, filename, col_types) {
  read_delim(paste0(subfolder, "/", filename, ".csv"),
             delim = ";",
             locale = locale(decimal_mark = ","),
             col_types = paste0("nnnccDcncncnncc", col_types)) %>%
    mutate(DateTime = as.POSIXct(paste(YearMonthDayCSV, substr(Quarter, 1, 5)), tz = "Europe/Brussels"))
}
