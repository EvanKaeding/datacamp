## Decision Trees

download.file(url = "https://assets.datacamp.com/production/course_2906/datasets/loans.csv",
              destfile = "lending-club.csv", method = "curl")

loans <- read.csv(file = "lending-club.csv", stringsAsFactors = TRUE)

## Build a decision tree for predictive classification of loan outcomes

# Load the rpart package

library(rpart)

# Build a lending model predicting loan outcome versus loan amount and credit score

loan_model <- rpart(outcome ~ loan_amount + credit_score, 
                    data = loans, method = "class", 
                    control = rpart.control(cp = 0))

# Make a prediction for someone with good credit - good_credit is a data.frame
# with values LOW for loan_amount and HIGH for credit_score

predict(loan_model, good_credit, type = "class")

# Make a prediction for someone with bad credit

predict(loan_model, bad_credit, type = "class")

## Plotting the decision tree

# Examine the loan_model object

loan_model

# Load the rpart.plot package

library(rpart.plot)

# Plot the loan_model with default settings

rpart.plot(loan_model)

# Plot the loan_model with customized settings

rpart.plot(loan_model, type = 3, 
           box.palette = c("red", "green"), 
           fallen.leaves = TRUE)

## Create a test and training dataset

# Determine the number of rows for training

nrow(loans) * 0.75

# Create a random sample of row IDs

sample_rows <- sample(nrow(loans), 8484)

# Create the training dataset

loans_train <- loans[sample_rows,]

# Create the test dataset

loans_test <- loans[-sample_rows,]

## Building and evaluating a larger tree

# The 'rpart' package is loaded into the workspace
# The loans_train and loans_test datasets have been created

# Grow a tree using all of the available applicant data

loan_model <- rpart(outcome ~ ., data = loans_train, method = "class", control = rpart.control(cp = 0))

# Make predictions on the test dataset

loans_test$pred <- predict(loan_model, loans_test, type = "class")

# Examine the confusion matrix

table(loans_test$pred, loans_test$outcome)

# Compute the accuracy on the test dataset

mean(loans_test$pred == loans_test$outcome)

## Prepruning trees

# The 'rpart' package is loaded into the workspace

# Grow a tree with maxdepth of 6

loan_model <- rpart(outcome ~ ., data = loans_train, method = "class", control = rpart.control(maxdepth = 6, cp = 0))

# Compute the accuracy of the simpler tree

loans_test$pred <- predict(loan_model, loans_test, type = "class")

mean(loans_test$outcome == loans_test$pred)


# Grow a tree with minsplit of 500

loan_model2 <- rpart(outcome ~ ., data = loans_train, method = "class", control = rpart.control(minsplit = 500, cp = 0))

# Compute the accuracy of the simpler tree

loans_test$pred2 <- predict(loan_model2, loans_test, type = "class")

mean(loans_test$pred2 == loans_test$outcome)

## Postpruning a tree

# The 'rpart' package is loaded into the workspace

# Grow an overly complex tree

loan_model <- rpart(outcome ~ ., data = loans_train, method = "class", control = rpart.control(cp = 0))

# Examine the complexity plot

plotcp(loan_model)

# Prune the tree

loan_model_pruned <- prune(loan_model, cp = 0.0014)

# Compute the accuracy of the pruned tree

loans_test$pred <- predict(loan_model_pruned, loans_test, type = "class")

mean(loans_test$pred == loans_test$outcome)

## Random forests

# Load the randomForest package

library(randomForest)

# Build a random forest model

loan_model <- randomForest(outcome ~ ., data = loans_train)

# Compute the accuracy of the random forest

loans_test$pred <- predict(loan_model, loans_test)

mean(loans_test$pred == loans_test$outcome)