# Append values to a list
person_list.append(2018)

# Print person_list
print(person_list)

# Print the last element of person_list
print(person_list[-1])

#####

# Update the person_dict dictionary
person_dict.update({'date':'2018-06', 'twitter_followers':458})

# Print the person_dict dictionary
print(person_dict)

# Import the numpy library with an alias: np
import numpy as np

# Load the boston dataset
boston = np.loadtxt('boston_data.csv', delimiter=',')

# Get the first row of data
first = boston[0]

# Calculate its mean
print(first.mean())

# Import the pandas library
import pandas as pd

# Load the tips.csv dataset
tips = pd.read_csv('tips.csv')

# Look at the first 5 rows
print(tips.head(5))