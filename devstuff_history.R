usethis::use_build_ignore("devstuff_history.R")
usethis::use_readme_rmd()
usethis::use_code_of_conduct()

# Description
# remotes::install_github("r-lib/desc")
desc::desc_add_orcid("0000-0002-1565-9313",
                     given = "Sébastien",
                     family = "Rochette")

# Documentation
usethis::use_pkgdown()
usethis::use_git_ignore("docs")
pkgdown::build_site()

attachment::att_amend_desc()


# Development
devtools::check()

# test unitaire

usethis::use_test("as_numeric.R")
devtools::test()
