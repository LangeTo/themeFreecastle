# this is for debugging and check the changes of the package
# without having to refresh it in the projects
source("R/theme_freecastle.R")

data(iris)

ggplot(
    data = iris,
    aes(
        x = Sepal.Length,
        y = Sepal.Width
    )
) +
    geom_point() +
    theme_freecastle(grid_lines = TRUE)
