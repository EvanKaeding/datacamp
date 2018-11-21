#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov 20 20:36:18 2018

@author: evan
"""

"" Final project

import glob
import pandas as pd

# Get a list of all the csv files
csv_files = glob.glob('*.csv')

# List comprehension that loads of all the files
dfs = [pd.read_csv(x) for x in csv_files]

# List comprehension that looks at the shape of all DataFrames
print([x.shape for x in dfs])

# Get the planes DataFrame
planes = dfs[2]

# Count the frequency of engines in our data
print(planes['engines'].value_counts())

# Look at all planes with >= 3 engines
print(planes.loc[planes['engines'] >= 3])

# Look at all planes with >= 3 engines and < 100 seats
print(planes.loc[(planes['engines'] >= 3) & (planes['seats'] < 100)])

import matplotlib.pyplot as plt

# Scatter plot of engines and seats
planes.plot(x='engines', y='seats', kind='scatter')
plt.show()

import matplotlib.pyplot as plt

# Histogram of seats
planes['seats'].plot(kind='hist')
plt.show()

import matplotlib.pyplot as plt

# Boxplot of seats by engine
planes.boxplot(column='seats', by='engine')
plt.xticks(rotation=45)
plt.show()

# Print time_hour
print(flights['time_hour'])

# Apply the function on data
flights['season'] = flights['time_hour'].apply(get_season)

# Print time_hour and season
print(flights[['time_hour', 'season']])

# Calculate total_delay
flights['total_delay'] = flights['dep_delay'] + flights['arr_delay']

# Mean total_delay by carrier
tdel_car = flights.groupby('carrier')['total_delay'].mean().reset_index()
print(tdel_car)

# Mean dep_delay and arr_delay for each season
dadel_season = flights.groupby('season')['dep_delay', 'arr_delay'].mean().reset_index()
print(dadel_season)

# Mean and std delays by origin
del_ori = flights.groupby('origin')['total_delay', 'dep_delay', 'arr_delay'].agg(['mean', 'std'])
print(del_ori)

# Create a figure
fig, (ax1, ax2) = plt.subplots(2, 1)

# Boxplot and barplot in the axes
sns.boxplot(x='origin', y='dep_delay', data=flights, ax=ax1)
sns.barplot(x='carrier', y='total_delay', data=tdel_car, ax=ax2)

# Label axes
ax1.set_title('Originating airport and the departure delay')

# Use tight_layout() so the plots don't overlap
fig.tight_layout()
plt.show()

# Look at the head of flights_sub
print(flights_sub.head())

# Create dummy variables
flights_dummies = pd.get_dummies(flights_sub['origin'])

# Look at the head of flights_dummies
print(flights_dummies.head())