#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Nov 11 15:50:18 2018

@author: evan
"""

import pandas as pd

# Load the country_timeseries dataset
ebola = pd.read_csv('country_timeseries.csv')

# Inspect the Date column
print(ebola['Date'].dtype)

# Convert the type of Date column into datetime
ebola['Date'] = pd.to_datetime(ebola['Date'], format='%m/%d/%Y')

# Inspect the Date column
print(ebola['Date'].dtype)

import pandas as pd

# Load the country_timeseries dataset
ebola = pd.read_csv('country_timeseries.csv')

# Inspect the Date column
print(ebola['Date'].dtype)

# Convert the type of Date column into datetime
ebola['Date'] = pd.to_datetime(ebola['Date'], format='%m/%d/%Y')

# Inspect the Date column
print(ebola['Date'].dtype)