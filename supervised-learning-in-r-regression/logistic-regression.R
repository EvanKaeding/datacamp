# Logistic Regression

# sparrow is in the workspace
summary(sparrow)

# Create the survived column
sparrow$survived <- sparrow$status == "Survived"

# Create the formula
(fmla <- formula(survived ~ total_length + weight + humerus))

# Fit the logistic regression model
sparrow_model <- glm(fmla, sparrow, family = binomial)

# Call summary
summary(sparrow_model)

# Call glance
(perf <- glance(sparrow_model))

# Calculate pseudo-R-squared
(pseudoR2 <- 1 - glance(sparrow_model)$deviance/glance(sparrow_model)$null.deviance)

