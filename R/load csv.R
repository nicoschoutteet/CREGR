#' Import csv files which were extracted from DWH
#' @description This function imports a csv file into an R session.
#' The arguments include a reference to a subfolder of the working directory(filepath), a reference to the csv file (filename),
#' and an indication of the type of column (in abbreviate form, e.g. "n" = numeric, "d" = double, "c" = character).
#' @param filepath A string, including (if relevant) the subfolder where the csv file is stored (relative to the current working directory)
#' @examples df <- loadcsv_CREG(filepath = "source data/loadBelgium.csv")
#' @export

loadcsv_CREG <- function(filepath) {
    read_delim(filepath,
               delim = ";",
               locale = locale(decimal_mark = ","),
               guess_max = 1000000) %>%
    mutate(DateTime = as.POSIXct(paste(YearMonthDayCSV, substr(Quarter, 1, 5)), format = "%Y-%m-%d %H:%M", tz = "Europe/Brussels")) %>%
    select(DateTime, everything())
}
