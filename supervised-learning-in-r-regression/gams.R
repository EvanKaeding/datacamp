# GAMs

# soybean_train is in the workspace
summary(soybean_train)

# Plot weight vs Time (Time on x axis)
ggplot(soybean_train, aes(x = Time, y = weight)) + 
        geom_point()

# Load the package mgcv
library(mgcv)

# Create the formula 
(fmla.gam <- formula(weight ~ s(Time)))

# Fit the GAM Model
model.gam <- gam(fmla.gam, familly = gaussian, data = soybean_train)

# Call summary() on model.lin and look for R-squared
summary(model.lin)

# Call summary() on model.gam and look for R-squared
summary(model.gam)

# Call plot() on model.gam
plot(model.gam)

# soybean_test is in the workspace
summary(soybean_test)

# Get predictions from linear model
soybean_test$pred.lin <- predict(model.lin, newdata = soybean_test)

# Get predictions from gam model
soybean_test$pred.gam <- as.numeric(predict(model.gam, newdata = soybean_test))

# Gather the predictions into a "long" dataset
soybean_long <- soybean_test %>%
        gather(key = modeltype, value = pred, pred.lin, pred.gam)

# Calculate the rmse
soybean_long %>%
        mutate(residual = weight - pred) %>%     # residuals
        group_by(modeltype) %>%                  # group by modeltype
        summarize(rmse = sqrt(mean(residual^2))) # calculate the RMSE

# Compare the predictions against actual weights on the test data
soybean_long %>%
        ggplot(aes(x = Time)) +                          # the column for the x axis
        geom_point(aes(y = weight)) +                    # the y-column for the scatterplot
        geom_point(aes(y = pred, color = modeltype)) +   # the y-column for the point-and-line plot
        geom_line(aes(y = pred, color = modeltype, linetype = modeltype)) + # the y-column for the point-and-line plot
        scale_color_brewer(palette = "Dark2")
