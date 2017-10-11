### Set global options for this packages: Shamelessly stolen from /devtools/R/zzz.R
.onLoad <- function(libname, pkgname) {
  opt <- options()

  opt.mnistR <- list(
      mnistR.destfolder = NULL # default to no folder
  )

  ### Only set the options which have not already been set (i.e. don't override defaults)
  toset <- !(names(opt.mnistR) %in% names(opt)) # Which options have NOT been set already?
  if(any(toset)) options(opt.mnistR[toset])     # Set the options which have not been set

  invisible()
}
