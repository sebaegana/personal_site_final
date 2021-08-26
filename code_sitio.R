if (!requireNamespace("remotes")) install.packages("remotes")

remotes::install_github("rstudio/blogdown")

library(blogdown)

new_site(theme = "wowchemy/starter-academic")

blogdown::serve_site()
blogdown:::preview_site()
