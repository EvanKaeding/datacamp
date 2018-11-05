## Non-standard evaluation

# Use big_x() to find rows in diamonds_sub where x > 7
big_x(diamonds_sub, 7)

# Remove the x column from diamonds
diamonds_sub$x <- NULL

# Create variable x with value 1
x <- 1

# Use big_x() to find rows in diamonds_sub where x > 7
big_x(diamonds_sub, 7)

# Create a threshold column with value 100
diamonds_sub$threshold <- 100

# Use big_x() to find rows in diamonds_sub where x > 7
big_x(diamonds_sub, 7)

big_x <- function(df, threshold) {
        # Write a check for x not being in df
        if(!"x" %in% colnames(df)){
                stop("df must contain variable called x", call. = FALSE)
        }
        
        
        # Write a check for threshold being in df
        if("threshold" %in% colnames(df)){
                stop("df must not contain variable called threshold", call. = FALSE)
        }
        
        
        
        dplyr::filter(df, x > threshold)
}

