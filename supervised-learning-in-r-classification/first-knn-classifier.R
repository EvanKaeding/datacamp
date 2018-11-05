# Load the 'class' package - NOTE - df next_sign is provided in the workshop
library(class)

# Create a vector of labels
sign_types <- signs$sign_type

# Classify the next sign observed
knn(train = signs[-1], test = next_sign, cl = sign_types)

# The arguments to the knn function are the training data, the test data, and
# a factor of the TRUE classifications of the training set

# Examine the structure of the signs dataset
str(signs)

# Count the number of signs of each type
table(signs$sign_type)

# Check r10's average red level by sign type
aggregate(r10 ~ sign_type, data = signs, mean)

#Use kNN to identify the test road signs
> sign_types <- signs$sign_type
> signs_pred <- knn(train = signs[-1], test = test_signs[-1], cl = sign_types)
> 
        > # Create a confusion matrix of the actual versus predicted values
        > signs_actual <- test_signs$sign_type
> table(signs_pred, signs_actual)
signs_actual
signs_pred   pedestrian speed stop
pedestrian         19     2    0
speed               0    17    0
stop                0     2   19
> 
        > # Compute the accuracy
        > mean(signs_pred == signs_actual)
[1] 0.9322034
> # Use kNN to identify the test road signs
        > sign_types <- signs$sign_type
> signs_pred <- knn(train = signs[-1], test = test_signs[-1], cl = sign_types)
> 
        > # Create a confusion matrix of the actual versus predicted values
        > signs_actual <- test_signs$sign_type
> table(signs_pred, signs_actual)
signs_actual
signs_pred   pedestrian speed stop
pedestrian         19     2    0
speed               0    17    0
stop                0     2   19
> 
        > # Compute the accuracy
        > mean(signs_pred == signs_actual)
[1] 0.9322034
> 
        
# Compute the accuracy of the baseline model (default k = 1)
k_1 <- knn(train = signs[-1], test = signs_test[-1], cl = sign_types)
mean(k_1 == signs_actual)

# Modify the above to set k = 7
k_7 <- knn(train = signs[-1], test = signs_test[-1], cl = sign_types, k = 7)
mean(k_7 == signs_actual)

# Set k = 15 and compare to the above
k_15 <- knn(train = signs[-1], test = signs_test[-1], cl = sign_types, k = 15)
mean(k_15 == signs_actual)

# Use the prob parameter to get the proportion of votes for the winning class
sign_pred <- knn(train = signs[-1], test = signs_test[-1], cl = sign_types, k = 7, prob = TRUE)

# Get the "prob" attribute from the predicted classes
sign_prob <- attr(sign_pred, "prob")

# Examine the first several predictions
head(sign_prob)

# Examine the proportion of votes for the winning class
head(sign_pred)

# define a min-max normalize() function
normalize <- function(x) {
        return((x - min(x)) / (max(x) - min(x)))
}
