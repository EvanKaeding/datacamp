# For loops

# Replace the 1:ncol(df) sequence
for (i in seq_along(df)) {
        print(median(df[[i]]))
}

# Change the value of df
df <- data.frame()


# Repeat for loop to verify there is no error
for (i in seq_along(df)) {
        print(median(df[[i]]))
}

# Create new double vector: output
output <- vector("double", ncol(df))

# Alter the loop
for (i in seq_along(df)) {
        # Change code to store result in output
        output[[i]] <- median(df[[i]])
}

# Print output
output

data.frames are just lists!