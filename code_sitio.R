if (!requireNamespace("remotes")) install.packages("remotes")
library(blogdown)

# remotes::install_github("rstudio/blogdown")
# new_site(theme = "wowchemy/starter-academic")

blogdown::serve_site()
blogdown:::preview_site()
blogdown::hugo_build()


stop_server()

blogdown::new_post(title = "Hi Hugo", 
                   ext = '.Rmarkdown', 
                   subdir = "post")

# blogdown::config_Rprofile() 
# 
# file.edit(".gitignore")
# 
# blogdown::check_gitignore()
# 
# blogdown::check_content()
# 
# rstudioapi::navigateToFile("config.yaml", line = 3)
# 
# 
# blogdown::config_netlify()
# 
# blogdown::check_hugo()
# 
# rstudioapi::navigateToFile("config/_default/params.toml")
# 
# rstudioapi::navigateToFile("config/_default/menus.toml")
# 
# rstudioapi::navigateToFile("config.yaml", line = 15)

