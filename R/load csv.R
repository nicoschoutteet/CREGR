#' Import csv files which were extracted from DWH
#' @description This function imports a csv file into an R session.
#' The arguments include a reference to a subfolder of the working directory(filepath), a reference to the csv file (filename),
#' and an indication of the type of column (in abbreviate form, e.g. "n" = numeric, "d" = double, "c" = character).
#' @param subfolder A string, including the subfolder where the csv file is stored
#' @param filename A string, including the name of the csv file (don't include the extension ".csv" as this is added automatically)
#' @param col_types A string describing, in short form, the column types of the data itself (i.e. not the year, month, day, etc. variables as those are added automatically)
#' @param quarterlyresolution A string describing whether hourly (FALSE) or quarterly (TRUE) data are imported (default value = FALSE)
#' @examples df <- loadcsv_CREG(filepath = "source data", filename = "loadBE", col_types = "n")
#' @export

loadcsv_CREG <- function(subfolder, filename, col_types, resolution = "h") {
  if (resolution == "h") {
    read_delim(paste0(subfolder, "/", filename, ".csv"),
               delim = ";",
               locale = locale(decimal_mark = ","),
               col_types = paste0("nnnccDcncncnncc", col_types)) %>%
    mutate(DateTime = as.POSIXct(paste(YearMonthDayCSV, substr(Quarter, 1, 5)), tz = "Europe/Brussels")) %>%
    select(DateTime, everything())
    } else if (resolution == "q") {
    read_delim(paste0(subfolder, "/", filename, ".csv"),
               delim = ";",
               locale = locale(decimal_mark = ","),
               col_types = paste0("nnnccDcncncnnncc", col_types)) %>%
    mutate(DateTime = as.POSIXct(paste(YearMonthDayCSV, substr(Quarter, 1, 5)), tz = "Europe/Brussels")) %>%
    select(DateTime, everything())
    }
}

#' Import multiple csv files which were extracted from DWH and join them
#' @description This function imports a csv file into an R session.
#' The arguments include a reference to a subfolder of the working directory(filepath), a reference to the csv files (filenames),
#' and an indication of the type of column (in abbreviate form, e.g. "n" = numeric, "d" = double, "c" = character).
#' @param subfodler A string, including the subfolder where the csv file is stored
#' @param filename A string vector, including the name of the csv file (don't include the extension ".csv" as this is added automatically) (e.g. c("loadBE", "loadNL"))
#' @param col_types A string vector, describing, in short form, the column types of the data itself (i.e. not the year, month, day, etc. variables as those are added automatically) (e.g. c("nn", "nnnn"))
#' @param quarterlyresolution A string vector, describing whether hourly or quarterly data are inmported (e.g. "q")
#' @examples df <- loadmultiplecsv_CREG(filepath = "source data", filename = c("loadBE", "loadNL"), col_types = c("n", "n"), quarterlyresolution = c("h", "h"))
#' @export

loadmultiplecsv_CREG <- function(subfolder, filenames, col_types, resolution) {
  tempfilepaths <- paste0(subfolder, "/", filenames, ".csv")
  tempcoltypesh <- paste0("nnnccDcncncnncc", col_types)
  tempcoltypesq <- paste0("nnnccDcncncnnncc", col_types)
  resolution <- resolution
  dataframelist <- list()
  for (i in 1) {
    if (resolution[[i]] == "h") {
      dataframelist[[i]] <- read_delim(tempfilepaths[[i]],
                                       delim = ";",
                                       col_types = tempcoltypesh[[i]],
                                       locale = locale(decimal_mark = ",")) %>%
      mutate(DateTime = as.POSIXct(paste(YearMonthDayCSV, substr(Quarter, 1, 5)), tz = "Europe/Brussels"))
      } else if (resolution[[i]] == "q") {
      dataframelist[[i]] <- read_delim(tempfilepaths[[i]],
                                       delim = ";",
                                       col_types = tempcoltypesq[[i]],
                                       locale = locale(decimal_mark = ",")) %>%
      mutate(DateTime = as.POSIXct(paste(YearMonthDayCSV, substr(Quarter, 1, 5)), tz = "Europe/Brussels"))
      }
  }
  for (i in seq(2, length(tempfilepaths))) {
    if (resolution[[i]] == "h") {
      dataframelist[[i]] <- read_delim(tempfilepaths[[i]],
                                       delim = ";",
                                       col_types = tempcoltypesh[[i]],
                                       locale = locale(decimal_mark = ",")) %>%
      mutate(DateTime = as.POSIXct(paste(YearMonthDayCSV, substr(Quarter, 1, 5)), tz = "Europe/Brussels")) %>%
      select(DateTime, last_col(1:nchar(col_types[[i]])))
      } else if (resolution[[i]] == "q") {
      dataframelist[[i]] <- read_delim(tempfilepaths[[i]],
                                       delim = ";",
                                       col_types = tempcoltypesq[[i]],
                                       locale = locale(decimal_mark = ",")) %>%
      mutate(DateTime = as.POSIXct(paste(YearMonthDayCSV, substr(Quarter, 1, 5)), tz = "Europe/Brussels")) %>%
      select(DateTime, last_col(1:nchar(col_types[[i]])))
      }
  }
  plyr::join_all(dataframelist, by = "DateTime", type = "left") %>%
  select(DateTime, everything())
}
