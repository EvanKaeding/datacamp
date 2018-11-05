# Functional programming

# Using a for loop

# Initialize output vector
output <- vector("double", ncol(df))  

# Fill in the body of the for loop
for (i in seq_along(df)) {            
        output[[i]] <- median(df[[i]])
}

# View the result
output

# Turn this code into col_median()

col_median <- function(df) {
        
        output <- vector("double", ncol(df))  
        for (i in seq_along(df)) {            
                output[[i]] <- median(df[[i]])      
        }
        output
}

# Create col_mean() function to find column means
col_mean <- function(df) {
        output <- numeric(length(df))
        for (i in seq_along(df)) {
                output[[i]] <- mean(df[[i]])
        }
        output
}

# Define col_sd() function

col_sd <- function(df) {
        output <- numeric(length(df))
        for (i in seq_along(df)) {
                output[[i]] <- sd(df[[i]])
        }
        output
}

# Add a second argument called power
f <- function(x, power) {
        # Edit the body to return absolute deviations raised to power
        abs(x - mean(x))^power
}

# Col_summary function

col_summary <- function(df, fun) {
        output <- vector("numeric", length(df))
        for (i in seq_along(df)) {
                output[[i]] <- fun(df[[i]])
        }
        output
}

# Find the column medians using col_median() and col_summary()
col_median(df)
col_summary(df, median)

# Find the column means using col_mean() and col_summary()
col_mean(df)
col_summary(df, mean)


# Find the column IQRs using col_summary()
col_summary(df, IQR)

# Load the purrr package
library(purrr)

# Use map_dbl() to find column means
map_dbl(df, mean)

# Use map_dbl() to column medians
map_dbl(df, median)

# Use map_dbl() to find column standard deviations
map_dbl(df, sd)

# Find the mean of each column
map_dbl(planes, mean)

# Find the mean of each column, excluding missing values
map_dbl(planes, mean, na.rm = TRUE)

# Find the 5th percentile of each column, excluding missing values
map_dbl(planes, quantile, probs = 0.05, na.rm = TRUE)

# Find the columns that are numeric
map_lgl(df3, is.numeric)

# Find the type of each column
map_chr(df3, typeof)

# Find a summary of each column
map(df3, summary)

# Fitting a regression using Map

cyl <- split(mtcars, mtcars$cyl)

# Examine the structure of cyl
str(cyl)

# Extract the first element into four_cyls
four_cyls <- cyl[[1]]

# Fit a linear regression of mpg on wt using four_cyls
lm(mpg ~ wt, data = four_cyls)

# Save the result from the previous exercise to the variable models
models <- map(cyl, ~ lm(mpg ~ wt, data = .))

# Use map and coef to get the coefficients for each model: coefs
coefs <- map(models, coef)

# Use string shortcut to extract the wt coefficient 
map(coefs, "wt")

coefs <- map(models, coef)

# use map_dbl with the numeric shortcut to pull out the second element
map_dbl(coefs, 2)
# Rewrite to call an anonymous function
map(cyl, function(df) lm(mpg ~ wt, data = df))

# Define models (don't change)
models <- mtcars %>% 
        split(mtcars$cyl) %>%
        map(~ lm(mpg ~ wt, data = .))

# Rewrite to be a single command using pipes 
summaries <- map(models, summary) %>%
        map_dbl("r.squared")

# Define models (don't change)
models <- mtcars %>% 
        split(mtcars$cyl) %>%
        map(~ lm(mpg ~ wt, data = .))

# Rewrite to be a single command using pipes 
summaries <- models %>%
        map(summary) %>%
        map_dbl("r.squared")

