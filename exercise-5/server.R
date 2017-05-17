#INFO 201 M18 Exercise 5 Server

#Require the following: shiny, HSUAR, dyplr, and ggplot2
library(shiny)
# install.packages("HSAUR")
library(HSAUR)
library(dplyr)
library(ggplot2)

#Load the dataset 'womensrole' from the HSUAR package (same way you would load a built in dataset)
data <- womensrole


#Here you will define the data that is shown based on your inputs defined in the UI
#and turn it into an output plot
#Hint: reference the input values using 'input$inputID'
shinyServer(function(input, output) {
   
  #plotNameHere will become what you named your plot in the UI
  output$opinionPlot <- renderPlot({
    
    #Here use your different input values to define what data is used to render your plot
    #The x axis will be the level of education
    #The y axis will be the level of agreement or disagreement
    #The dataset used will be filtered by sex
    
    
    #Filter the dataset based on whether the input is Men, Women, or Both
    if (input$sex == "Male") {
      plot.data <- data %>% filter(sex == "Male")
    } else if (input$sex == "Women") {
      plot.data <- data %>% filter(sex == "Women")
    } else {
      plot.data <- data
    }
  
    
    #Define a y axis value based on the input Agree or Disagree
    if (input$thoughts == "Agree") {
      thoughts = plot.data$agree
    } else {
      thougths = plot.data$disagree
    }
    
    #Using the values you just defined, construct a scatterplot using ggplot2
    #x will be defined by education, y by agree/disagree
    #Bonus: Factor the color field by sex 
    #(this will allow you to visually see the difference between Men and Women when Both are selected)
    ggplot2(plot.data, aes(x = education, y = thoughts, color = factor(sex)))
    
  })
  
})
