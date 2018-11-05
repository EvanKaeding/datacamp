## Plotting residuals

# unemployment is in the workspace

summary(unemployment)

# unemployment_model is in the workspace

summary(unemployment_model)

# Make predictions from the model

unemployment$predictions <- predict(unemployment_model)

# Fill in the blanks to plot predictions (on x-axis) versus the female_unemployment rates

ggplot(unemployment, aes(x = predictions, y = female_unemployment)) + 
        geom_point() + 
        geom_abline()

# Calculate residuals

unemployment$residuals <- unemployment$female_unemployment - unemployment$predictions

# Fill in the blanks to plot predictions (on x-axis) versus the residuals

ggplot(unemployment, aes(x = predictions, y = residuals)) + 
        geom_pointrange(aes(ymin = 0, ymax = residuals)) + 
        geom_hline(yintercept = 0, linetype = 3) + 
        ggtitle("residuals vs. linear model prediction")

## Gain Curves

library(WVPlots)

# unemployment is in the workspace (with predictions)

summary(unemployment)

# unemployment_model is in the workspace

summary(unemployment_model)

# Load the package WVPlots

library(WVPlots)

# Plot the Gain Curve

GainCurvePlot(unemployment, "predictions", "female_unemployment", "Unemployment model")

