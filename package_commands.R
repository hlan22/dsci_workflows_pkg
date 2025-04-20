# --------------- MAKE A PACKAGE ------------------------------
# All code run in Rstudio console to make a package!

# load the useful library that contains usethis
library(devtools)

# make a package in a new (or existing) directory
devtools::create_package("~/git/wordplay")

# load again if in new RStudio instance
library(devtools)

devtools::use_git()
#> ✔ Initialising Git repo.
#> ✔ Adding ".Rhistory", ".Rdata", ".httr-oauth", ".DS_Store", and ".quarto" to '.gitignore'.

# make functions in the R/ file
devtools::use_r("all_words_summary") # makes "R/all_words_summary.R" file
devtools::use_r("starting_letter_plot")
devtools::use_r("top_words_plot")
devtools::use_r("word_characteristics")
devtools::use_r("word_length_plot")


# --------- WRITE YOUR FUNCTIONS --------------------------------

# load functions for practical use
devtools::load_all()

# this should be FALSE; meaning the package isn't being sourced, 
# it is used from the load_all call
exists("all_words_summary", where = globalenv(), inherits = FALSE)
#> [1] FALSE


# --------- COMMIT YOUR WORK --------------------------------
# (in Terminal)
# git remote add origin https://github.com/hlan22/wordplay.git
# git remove -v # verifies your push/fetch connection


# --------- OTHER PARTS OF PACKAGE ------------------------------

# check that all parts of the package work
devtools::check()

# Add a license (or two)
use_mit_license()

# updated .Rbuildignore

# see that you pass the errors/warnings from check
devtools::check()

# --------- WRITE ROXYGEN STATEMENTS --------------------------------

# write supporting documentation for functions
devtools::document()

# now you can see the help section for your functions (from roxygen)
?word_length_plot

# extra fixes/changes
devtools::document()
devtools::check()

# after checking everything is good we can install our minimum viable product
devtools::install()

# and now we can use it ! :)
library(wordplay)

# --------- PACKAGE USABLE; LETS IMPROVE --------------------------------

# create testing directory, adds testthat to suggested, creates script
use_testthat()

# create test file for each of the functions
use_test("all_words_summary")
use_test("top_words_plot")
use_test("word_charactersitics")
use_test("word_length_plot")



test()

devtools::check()
devtools::document()
devtools::install()

load_all()
test()

library(devtools)

use_readme_rmd()
#> ✔ Writing 'README.Rmd'.
#> ✔ Adding "^README\\.Rmd$" to '.Rbuildignore'.
#> ☐ Update 'README.Rmd' to include installation instructions.
#> ✔ Writing '.git/hooks/pre-commit'.

devtools::build_readme()
