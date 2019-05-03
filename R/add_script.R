#' add script
#'
#' This function creates script inside the folder Script
#'
#' @param name the name of the script
#'
#' @export
#'
#' @importFrom glue glue
#' @importFrom yesno yesno
#'
#' @example
#' add_script("test")




add_script <- function(name) {


  where <- file.path(
    "Script", paste0(name, ".R")
  )

  check_file_exist <- function(file){
    res <- TRUE
    if (file.exists(file)){
      res <- yesno::yesno("This file already exists, override?")
    }
    return(res)
  }

  if ( !check_file_exist(where) ) {
    return(invisible(FALSE))
  }

  file.create(where)
  write_there <- function(...){
    write(..., file = where, append = TRUE)
  }
  glue <- function(...){
    glue::glue(..., .open = "%", .close = "%")
  }

  write_there(paste(rep("#",100),collapse = ""))
  write_there(paste0("# Project:",paste(rep(" ",89),collapse = ""),"#"))
  write_there(paste0("# Authors:",paste(rep(" ",89),collapse = ""),"#"))
  write_there(paste0(glue("# Last update: %Sys.Date()%"),paste(rep(" ",74),collapse = ""),"#"))
  write_there(paste0("# IT Environment: R studio server",paste(rep(" ",66),collapse = ""),"#"))
  write_there(paste0("# Goal of the script :",paste(rep(" ",77),collapse = ""),"#"))
  write_there(paste(rep("#",100),collapse = ""))

}
