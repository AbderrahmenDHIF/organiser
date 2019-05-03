#' add_file
#'
#' This function creates folders inside the project
#'
#' @return
#' @export
#'
#' @importFrom usethis use_directory
#' @importFrom usethis use_readme_rmd
#'
#' @example
#' add_file()




add_file <- function() {

  usethis::use_directory("Data_src")
  usethis::use_directory("Data_save")
  usethis::use_directory("Output")
  usethis::use_directory("Script")

  add_script("R_00_global_script")
  add_script("R_01_Data_management")
  add_script("R_02_Data_analysis")

  usethis::use_readme_rmd()

}
