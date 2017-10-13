#
# Thanks to @daviddalpiaz and @brendano
#   Original code: https://gist.github.com/daviddalpiaz/ae62ae5ccd0bada4b9acd6dbc9008706
#   Modification of https://gist.github.com/brendano/39760
#

autoloadMNIST <- function(dest = paste0(getwd(), "/")) {
    downloadMNIST(dest)
    loadMNIST(dest)
}

loadMNIST <- function(dest = NULL) {
    train <- load_mnist_train(dest)
    test <- load_mnist_test(dest)

    list(train = train, test = test)
}

downloadMNIST  <- function(dest = NULL, verbose = TRUE) {
    download_mnist_train(dest, verbose = FALSE)
    download_mnist_test(dest, verbose = FALSE)

    if(verbose){
        msg <- sprintf("MNIST data downloaded successfully!\n\tData can be found in %s", dest)
        message(msg)
    }
}

autoload_mnist_train <- function(dest = paste0(getwd(), "/")) {
    download_mnist_train(dest)
    load_mnist_train(dest)
}

autoload_mnist_test <- function(dest = paste0(getwd(), "/")) {
    download_mnist_test(dest)
    load_mnist_test(dest)
}

load_mnist_train <- function(dest = NULL) {

    if (is.null(dest)) {
        dest <- get_option("mnistR.destfolder")
        if (is.null(dest)) {
            stop("Please either specify the destination folder where the MNIST data is located, or use downloadMNIST to download the data.")
        }
    }

    train <- load_image_file(paste0(dest, "train-images-idx3-ubyte"))
    train$y <- as.factor(load_label_file(paste0(dest, "train-labels-idx1-ubyte")))
    train
}

load_mnist_test <- function(dest = NULL) {

    if (is.null(dest)) {
        dest <- get_option("mnistR.destfolder")
        if (is.null(dest)) {
            stop("Please either specify the destination folder where the MNIST data is located, or use downloadMNIST to download the data.")
        }
    }

    test <- load_image_file(paste0(dest, "t10k-images-idx3-ubyte"))
    test$y  <- as.factor(load_label_file(paste0(dest, "t10k-labels-idx1-ubyte")))
    test
}

download_mnist_train <- function(dest = NULL, verbose = TRUE) {

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

    if(verbose){
        msg <- sprintf("MNIST training data downloaded successfully!\n\tData can be found in %s", dest)
        message(msg)
    }
}

download_mnist_test <- function(dest = NULL, verbose = TRUE) {

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

    if(verbose){
        msg <- sprintf("MNIST test data downloaded successfully!\n\tData can be found in %s", dest)
        message(msg)
    }
}
