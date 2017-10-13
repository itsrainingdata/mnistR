#
# Thanks to @daviddalpiaz and @brendano
#   Original code: https://gist.github.com/daviddalpiaz/ae62ae5ccd0bada4b9acd6dbc9008706
#   Modification of https://gist.github.com/brendano/39760
#

set_option <- function(opt, val){
    opt_to_set <- list()
    opt_to_set[opt] <- list(val)
    options(opt_to_set)
    invisible()
}

get_option <- function(opt){
    options()[[opt]]
}

# load image files
load_image_file <- function(filename) {
    f <- file(filename, 'rb')
    readBin(f, 'integer', n = 1, size = 4, endian = 'big')
    n    <- readBin(f, 'integer', n = 1, size = 4, endian = 'big')
    nrow <- readBin(f, 'integer', n = 1, size = 4, endian = 'big')
    ncol <- readBin(f, 'integer', n = 1, size = 4, endian = 'big')
    x <- readBin(f, 'integer', n = n * nrow * ncol, size = 1, signed = FALSE)
    close(f)
    data.frame(matrix(x, ncol = nrow * ncol, byrow = TRUE))
}

# load label files
load_label_file <- function(filename) {
    f <- file(filename, 'rb')
    readBin(f, 'integer', n = 1, size = 4, endian = 'big')
    n <- readBin(f, 'integer', n = 1, size = 4, endian = 'big')
    y <- readBin(f, 'integer', n = n, size = 1, signed = FALSE)
    close(f)
    y
}
