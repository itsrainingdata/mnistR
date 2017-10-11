<!-- README.md is generated from README.Rmd. Please edit that file -->
mnistR
======

A simple R package to download, collate, and load the classic [MNIST dataset](http://yann.lecun.com/exdb/mnist/) in R.

Installation
------------

You can install mnistR from github with:

``` r
# install.packages("devtools")
devtools::install_github("itsrainingdata/mnistR")
```

Usage
-----

Download the data to your local drive at `/path/to`:

``` r
mnistR::downloadMNIST(dest = "/path/to/")
```

Load the data (after downloading):

``` r
mnistR::loadMNIST(dest = "/path/to/")
```

The result is a list containing two data frames (`train` and `test`). The labels are stored in the last column, `train$y` and `test$y`.

Credit
------

This package is a port of code written by [@brendano](https://www.github.com/brendano) and [@daviddalpiaz](https://www.github.com/daviddalpiaz). The original code can be found here:

-   <https://gist.github.com/daviddalpiaz/ae62ae5ccd0bada4b9acd6dbc9008706>
-   <https://gist.github.com/brendano/39760>
