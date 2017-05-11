# Function to build a scatterplot

# Write your function to parameterize the following variables:
#   - Data to use
#   - Variable for the x axis
#   - Variable for the y axis
#   - Variable for the color
#   - Title of the plot (set a default of "Title")
#   - Label for the x axis (set a default of "X Title")
#   - Label for the y axis (set a default of "Y Title")
library(ggplot2)

ScatterPlot <- function(data, xVar, yVar, colorVar, title = "Title", xLab = "X Title", yLab = "Y Title") {
  p <- ggplot(data = data) + 
    geom_point(mapping = aes(x = data[,xVar], y=data[,yVar], color = data[,colorVar])) + 
    labs(title = title, x = xLab, y = yLab)
  
  return(p)
}

# This needs to be generalized hence the function with parameters above

# p <- ggplot(data = iris) + 
#  geom_point(mapping = aes(x = iris$Sepal.Length, y=data$Sepal.Width, color = iris$Species)) + 
#  labs(title = title, x = "Sepal Length", y = "Sepal Width")