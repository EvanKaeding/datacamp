# Poisson and Quasipoisson

# bikesJuly is in the workspace
str(bikesJuly)

# The outcome column
outcome 

# The inputs to use
vars 

# Create the formula string for bikes rented as a function of the inputs
(fmla <- paste(outcome, "~", paste(vars, collapse = " + ")))

# Calculate the mean and variance of the outcome
(mean_bikes <- mean(bikesJuly$cnt))
(var_bikes <- var(bikesJuly$cnt))

# Fit the model
bike_model <- glm(fmla, data = bikesJuly, family = quasipoisson)

# Call glance
(perf <- glance(bike_model))

# Calculate pseudo-R-squared
(pseudoR2 <- 1 - glance(bike_model)$deviance/glance(bike_model)$null.deviance)

# bikesAugust is in the workspace
str(bikesAugust)

# bike_model is in the workspace
summary(bike_model)

# Make predictions on August data
bikesAugust$pred  <- predict(bike_model, newdata = bikesAugust, type = "response")

# Calculate the RMSE
bikesAugust %>% 
        mutate(residual = pred - cnt) %>%
        summarize(rmse  = sqrt(mean(residual^2)))

# Plot predictions vs cnt (pred on x-axis)
ggplot(bikesAugust, aes(x = pred, y = cnt)) +
        geom_point() + 
        geom_abline(color = "darkblue")

# Visualizing the distribution

# Plot predictions and cnt by date/time
bikesAugust %>% 
        # set start to 0, convert unit to days
        mutate(instant = (instant - min(instant))/24) %>%  
        # gather cnt and pred into a value column
        gather(key = valuetype, value = value, cnt, pred) %>%
        filter(instant < 14) %>% # restric to first 14 days
        # plot value by instant
        ggplot(aes(x = instant, y = value, color = valuetype, linetype = valuetype)) + 
        geom_point() + 
        geom_line() + 
        scale_x_continuous("Day", breaks = 0:14, labels = 0:14) + 
        scale_color_brewer(palette = "Dark2") + 
        ggtitle("Predicted August bike rentals, Quasipoisson model")