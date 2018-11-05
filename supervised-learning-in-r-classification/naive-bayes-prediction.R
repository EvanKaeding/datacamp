# Naive Bayes predictions

download.file(url = "https://assets.datacamp.com/production/course_2906/datasets/locations.csv", 
                          destfile = "bretts-location.csv", method = "curl")
where9am <- read.csv(file = "bretts-location.csv", stringsAsFactors = TRUE)

# Doing a basic predicated prediction

# Compute P(A) 
p_A <- nrow(subset(where9am, location == "office"))/nrow(where9am)

# Compute P(B)
p_B <- nrow(subset(where9am, daytype == "weekday"))/nrow(where9am)

# Compute the observed P(A and B)
p_AB <- nrow(subset(where9am, location == "office", daytype == "weekday"))/nrow(where9am)

# Compute P(A | B)
p_A_given_B <- p_AB/p_B
print(p_A_given_B)

## Using the Naivebays package to build a model (NOT AVAILABLE FOR R 3.3)

# Load the naivebayes package
library(e1071)

# Build the location prediction model
locmodel <- naive_bayes(location ~ daytype, data = where9am)

# Predict Thursday's 9am location
predict(locmodel, newdata = data.frame(daytype = as.factor("weekday")))

# Predict Saturdays's 9am location
predict(locmodel, data.frame(daytype = as.factor("weekend")))

## Hashing out some of these probs

# The 'naivebayes' package is loaded into the workspace
# and the Naive Bayes 'locmodel' has been built

# Examine the location prediction model
print(locmodel)

# Obtain the predicted probabilities for Thursday at 9am
predict(locmodel, newdata = thursday9am , type = "prob")

# Obtain the predicted probabilities for Saturday at 9am
predict(locmodel, newdata = saturday9am , type = "prob")

## Building a multi-feature bayes model

# Build a NB model of location
locmodel <- naive_bayes(location ~ daytype + hourtype, data = locations)

# Predict Brett's location on a weekday afternoon
predict(locmodel, data.frame(daytype = "weekday", hourtype = "afternoon"))

# Predict Brett's location on a weekday evening
predict(locmodel, weekday_evening)

## Adding the Laplace correction

# Observe the predicted probabilities for a weekend afternoon
predict(locmodel, weekend_afternoon, type = "prob")


# Build a new model using the Laplace correction
locmodel2 <- naive_bayes(location ~ daytype + hourtype, 
                         data = locations, laplace = 1)

# Observe the new predicted probabilities for a weekend afternoon

predict(locmodel2, weekend_afternoon, type = "prob")


