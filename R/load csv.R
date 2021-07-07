#' Import csv files which were extracted from DWH
#' @description This function imports a csv file into an R session. 
#' The arguments include a reference to a subfolder of the working directory(filepath), a reference to the csv file (filename),
#' and an indication of the type of column (in abbreviate form, e.g. "n" = numeric, "d" = double, "c" = character).
#' @param filepath A string 
#' @param filename A string
#' @param datatypes A string
#' @examples df <- loadcsv_CREG(filepath = "source data", filename = "loadBE", datatypes = "n")
loadcsv_CREG <- function(filepath, filename, datatypes) {
  read_delim(paste0(filepath, "/", filename), 
             delim = ";", 
             locale = locale(decimal_mark = ","),
             col_types = paste0("nnnccDcncncnncc", datatypes)) %>% 
    mutate(DateTime = as.POSIXct(paste(YearMonthDayCSV, substr(Quarter, 1, 5)), tz = "Europe/Brussels"))
}