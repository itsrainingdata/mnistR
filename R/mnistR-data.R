load_mnist_list <- function(dest = NULL) {

    if (is.null(dest)) {
        dest <- get_option("mnistR.destfolder")
        if (is.null(dest)) {
            stop("Please either specify the destination folder where the MNIST data is located, or use downloadMNIST to download the data.")
        }
    }

    # load images
    train <- load_image_file(paste0(dest, "train-images-idx3-ubyte"))
    test  <- load_image_file(paste0(dest, "t10k-images-idx3-ubyte"))

    # load labels
    train$y <- as.factor(load_label_file(paste0(dest, "train-labels-idx1-ubyte")))
    test$y  <- as.factor(load_label_file(paste0(dest, "t10k-labels-idx1-ubyte")))

    list(train = train, test = test)
}

load_mnist_trn <- function(dest = NULL) {

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

load_mnist_tst <- function(dest = NULL) {

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

autoload_mnist_trn <- function() {
    mnistR::download_mnist_trn(dest = paste0(getwd(), "/"))
    mnistR::load_mnist_trn(dest = paste0(getwd(), "/"))
}

autoload_mnist_tst <- function() {
    mnistR::download_mnist_tst(dest = paste0(getwd(), "/"))
    mnistR::load_mnist_tst(dest = paste0(getwd(), "/"))
}
