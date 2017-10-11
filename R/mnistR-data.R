loadMNIST <- function(dest = NULL){
    if(is.null(dest)){
        dest <- get_option("mnistR.destfolder")

        if(is.null(dest)){
            stop("Please either specify the destination folder where the MNIST data is located, or use downloadMNIST to download the data.")
        }
    }

    # load images
    train = load_image_file(paste0(dest, "train-images-idx3-ubyte"))
    test  = load_image_file(paste0(dest, "t10k-images-idx3-ubyte"))

    # load labels
    train$y = as.factor(load_label_file(paste0(dest, "train-labels-idx1-ubyte")))
    test$y  = as.factor(load_label_file(paste0(dest, "t10k-labels-idx1-ubyte")))

    list(train = train, test = test)
}
