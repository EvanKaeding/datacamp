# Random Forests

# bikesJuly is in the workspace
str(bikesJuly)

# Random seed to reproduce results
seed <- set.seed(4545)

# The outcome column
(outcome <- "cnt")

# The input variables
(vars <- c("hr", "holiday", "workingday", "weathersit", "temp", "atemp", "hum", "windspeed"))

# Create the formula string for bikes rented as a function of the inputs
(fmla <- paste(outcome, "~", paste(vars, collapse = " + ")))

# Load the package ranger
library(ranger)

# Fit and print the random forest model
(bike_model_rf <- ranger(fmla, # formula 
                         bikesJuly, # data
                         num.trees = 500, 
                         respect.unordered.factors = "order", 
                         seed = seed))


# Print quasipoisson_plot
quasipoisson_plot

# Plot predictions and cnt by date/time
bikesAugust %>% 
        mutate(instant = (instant - min(instant))/24) %>%  # set start to 0, convert unit to days
        gather(key = valuetype, value = value, cnt, pred) %>%
        filter(instant < 14) %>% # first two weeks
        ggplot(aes(x = instant, y = value, color = valuetype, linetype = valuetype)) + 
        geom_point() + 
        geom_line() + 
        scale_x_continuous("Day", breaks = 0:14, labels = 0:14) + 
        scale_color_brewer(palette = "Dark2") + 
        ggtitle("Predicted August bike rentals, Random Forest plot")
