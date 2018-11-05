# function snippets

# Define example vectors x and y
x <- c( 1, 2, NA, 3, NA)
y <- c(NA, 3, NA, 3,  4)

# Count how many elements are missing in both x and y

sum(is.na(x) & is.na(y))

# Remove last function

f2 <- function(x) {
        if (length(x) <= 1) return(NULL)
        x[-length(x)]
}

# Rewrite mean_ci to take arguments named level and x
mean_ci <- function(level, x) {
        se <- sd(x) / sqrt(length(x))
        alpha <- 1 - level
        mean(x) + se * qnorm(c(alpha / 2, 1 - alpha / 2))
}

# Alter the mean_ci function
mean_ci <- function(x, level = 0.95) {
        if (length(x) == 0) {
                return(c(-Inf, Inf))
        }
        
        se <- sd(x) / sqrt(length(x))
        alpha <- 1 - level
        mean(x) + se * qnorm(c(alpha / 2, 1 - alpha / 2))
}

# Rename the function f() to replace_missings()
replace_missings <- function(x, replacement) {
        # Change the name of the y argument to replacement
        x[is.na(x)] <- replacement
        cat(sum(is.na(x)), replacement, "\n")
        x
}

# Rewrite the call on df$z to match our new names
df$z <- replace_missings(df$z, 0)

replace_missings <- function(x, replacement) {
        # Define is_miss
        is_miss <- (is.na(x))
        
        # Rewrite rest of function to refer to is_miss
        x[is_miss] <- replacement
        cat(sum(is_miss), replacement, "\n")
        x
}

replace_missings <- function(x, replacement) {
        is_miss <- is.na(x)
        x[is_miss] <- replacement
        
        # Rewrite to use message()
        message(sum(is_miss)," missings replaced by the value ", replacement)
        x
}

# Check your new function by running on df$z
df$z <- replace_missings(df$z, 0)