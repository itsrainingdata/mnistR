<!-- README.md is generated from README.Rmd. Please edit that file -->
mnistR
======

A simple R package to download, collate, and load the classic [MNIST dataset](http://yann.lecun.com/exdb/mnist/) in R.

Installation
------------

You can install mnistR from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("itsrainingdata/mnistR")
```

Usage
-----

Access the data in one line, as quickly as possible:

``` r
MNIST <- mnistR::autoloadMNIST()
```

By default, the data will be saved to the current working directory. This directory can be manually specified via the `dest` argument (see Overview).

Overview
--------

Download the data to your local drive at `/path/to`:

``` r
mnistR::downloadMNIST(dest = "/path/to/")
```

Load the data (after downloading):

``` r
mnistR::loadMNIST(dest = "/path/to/")
```

The result is a list containing two data frames (`train` and `test`). The labels are stored in the last column, `train$y` and `test$y`.

The `autoloadMNIST` method is simply a wrapper to combine these steps into one method. For even finer grained access, see the methods `load_mnist_train`, `load_mnist_test`, and the corresponding `download` and `autoload` methods.

Credit
------

This package is a port of code written by [@brendano](https://www.github.com/brendano) and [@daviddalpiaz](https://www.github.com/daviddalpiaz). The original code can be found here:

-   <https://gist.github.com/daviddalpiaz/ae62ae5ccd0bada4b9acd6dbc9008706>
-   <https://gist.github.com/brendano/39760>
