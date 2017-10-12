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

download_mnist_trn <- function(dest = NULL) {

    if (is.null(dest)) {
        dest <- get_option("mnistR.destfolder")
        if (is.null(dest)) {
            stop("Please choose a destination folder to store the data!")
        }
    } else {
        set_option("mnistR.destfolder", dest)
    }

    # download data from http://yann.lecun.com/exdb/mnist/
    download.file("http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz",
                  paste0(dest, "train-images-idx3-ubyte.gz"))
    download.file("http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz",
                  paste0(dest, "train-labels-idx1-ubyte.gz"))

    # gunzip the files
    R.utils::gunzip(paste0(dest, "train-images-idx3-ubyte.gz"))
    R.utils::gunzip(paste0(dest, "train-labels-idx1-ubyte.gz"))

    msg <- sprintf("MNIST train data downloaded successfully!\n\tData can be found in %s", dest)
    message(msg)
}

download_mnist_tst <- function(dest = NULL) {

    if (is.null(dest)) {
        dest <- get_option("mnistR.destfolder")
        if (is.null(dest)) {
            stop("Please choose a destination folder to store the data!")
        }
    } else {
        set_option("mnistR.destfolder", dest)
    }

    # download data from http://yann.lecun.com/exdb/mnist/
    download.file("http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz",
                  paste0(dest, "t10k-images-idx3-ubyte.gz"))
    download.file("http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz",
                  paste0(dest, "t10k-labels-idx1-ubyte.gz"))

    # gunzip the files
    R.utils::gunzip(paste0(dest, "t10k-images-idx3-ubyte.gz"))
    R.utils::gunzip(paste0(dest, "t10k-labels-idx1-ubyte.gz"))

    msg <- sprintf("MNIST test data downloaded successfully!\n\tData can be found in %s", dest)
    message(msg)
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
