# --------------- MAKE A PACKAGE ------------------------------
# All code run in Rstudio console to make package

# load the useful library that contains usethis
library(devtools)

# make a package in a new (or existing) directory
devtools::create_package("~/git/wordplay")

# load again if in new RStudio instance
library(devtools)

# make package a git repo
devtools::use_git()
#> ✔ Initialising Git repo.
#> ✔ Adding ".Rhistory", ".Rdata", ".httr-oauth", ".DS_Store", and ".quarto" to '.gitignore'.

# creates files for functions in the R/ folder
devtools::use_r("all_words_summary")
devtools::use_r("top_words_plot")
devtools::use_r("word_characteristics")
devtools::use_r("word_length_plot")

# --------------- WRITE YOUR FUNCTIONS ------------------------------

# loads all functions locally
devtools::load_all()

# checks that functions are not being sourced, that load all works
exists("all_words_summary", where = globalenv(), inherits = FALSE)
#> [1] FALSE

# --------------- COMMIT YOUR WORK ------------------------------
# (in terminal)
# git remote add origin https://github.com/hlan22/wordplay.git
# git remove -v # verifies your push/fetch connection
# ---------------------------------------------------------------

# ensures package is in working order, gives errors warnings and tests
devtools::check()

# add a license
devtools::use_mit_license()

# updated .Rbuildignore

# make sure updates fix check warnings and errors
devtools::check()

# --------------- ADD ROXYGEN STATEMENTS ------------------------------

# add documentation about functions after roxygen statements
devtools::document()

# now after documenting you can see the ? help for your functions :)
?word_length_plot

# re-run to make sure everything is working
devtools::document()
devtools::check()

# install package
devtools::install()

# now you are able to use it! minimum viable product
library(wordplay)


# --------------- PACKAGE USEABLE; ADD MORE ------------------------------

# creates testthat directory, adds to suggested, creates script
devtools::use_testthat()

# fastest to do this with all R/ function files open
devtools::use_test()

# however, can create manual testing files too
devtools::use_test("all_words_summary")
devtools::use_test("top_words_plot")
devtools::use_test("word_charactersitics")
devtools::use_test("word_length_plot")


# --------------- WRITE TESTS ------------------------------

# check that your tests are passing
library(testthat) # i believe is already apart of devtools
testthat::test()

# re-run and update package based off of tests (tests are ran with check)
devtools::check()
devtools::document()
devtools::install()

# update and check tests
library(devtools)
testthat::test()

# --------------- ADD MORE INFO ------------------------------

# adds package to imports field of DESCRIPTION
use_package("ggplot2")

# if renaming functions
rename_files("function_name", "new_function_name")
# MUST redo document() if so

# --------------- FIX UP README ------------------------------

# initialize a basic README.Rmd for your github
devtools::use_readme_rmd()
#> ✔ Writing 'README.Rmd'.
#> ✔ Adding "^README\\.Rmd$" to '.Rbuildignore'.
#> ☐ Update 'README.Rmd' to include installation instructions.
#> ✔ Writing '.git/hooks/pre-commit'.

# add code coverage
usethis::use_coverage()
# report the R CMD check status of your development package
usethis::use_github_actions()
# reports the current version of your package on CRAN
usethis::use_cran_badge()

# make the README.md file with plots and examples
devtools::build_readme()

# --------------- OTHER IMPORTANT ------------------------------

# add licenses, which will update DESCRIPTION
use_cc0_license()
use_mit_license()
# also makes that additional license with year and authors

# --------------- FINAL PRODUCT ------------------------------

# --------------- EXTRA THINGS  ------------------------------

# make a NEWS.md file
usethis::use_news_md()

# pkgdown website
usethis::use_pkgdown()
#> ✔ Setting active project to "/tmp/RtmpVinU26/mypackage".
#> ✔ Adding "^_pkgdown\\.yml$", "^docs$", and "^pkgdown$" to
#>   '.Rbuildignore'.
#> ✔ Adding "docs" to '.gitignore'.
#> ✔ Writing '_pkgdown.yml'.
#> ☐ Edit '_pkgdown.yml'.
#> ✔ Setting active project to "<no active project>".
pkgdown::build_site()

usethis::use_pkgdown_github_pages()

# make a logo eventually!
# usethis::use_logo()

# make a vignette for the package
usethis::use_vignette("wordplay")