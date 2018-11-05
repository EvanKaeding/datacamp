## What is regression?

# unemployment is loaded in the workspace

summary(unemployment)

# Define a formula to express female_unemployment as a function of male_unemployment

fmla <- formula(female_unemployment ~ male_unemployment)

# Print it

print(fmla)

# Use the formula to fit a model: unemployment_model

unemployment_model <- lm(fmla, data = unemployment)

# Print it

print(unemployment_model)

## Check out the model

# broom and sigr are already loaded in your workspace

# Print unemployment_model

print(unemployment_model)

# Call summary() on unemployment_model to get more details

summary(unemployment_model)

# Call glance() on unemployment_model to see the details in a tidier form

glance(unemployment_model)

# Call wrapFTest() on unemployment_model to see the most relevant details

wrapFTest(unemployment_model)

# unemployment is in your workspace

summary(unemployment)

# newrates is in your workspace

newrates

# Predict female unemployment in the unemployment data set

unemployment$prediction <-  predict(unemployment_model)

# load the ggplot2 package

library(ggplot2)

# Make a plot to compare predictions to actual (prediction on x axis). 

ggplot(unemployment, aes(x = prediction, y = female_unemployment)) + 
        geom_point() +
        geom_abline(color = "blue")

# Predict female unemployment rate when male unemployment is 5% (newrates is a data.frame)

pred <- predict(unemployment_model, newrates)

# Print it

pred

## Creating a multivariate model and plotting the results

# bloodpressure is in your workspace
summary(bloodpressure)

# bloodpressure_model is in your workspace
bloodpressure_model

# predict blood pressure using bloodpressure_model :prediction

bloodpressure$prediction <- predict(bloodpressure_model, bloodpressure)

# plot the results
ggplot(data = bloodpressure, aes(x = prediction, y = blood_pressure)) + 
        geom_point() +
        geom_abline(color = "blue")