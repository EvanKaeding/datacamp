#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Nov 11 18:17:40 2018

@author: evan
"""

import seaborn as sns
import matplotlib.pyplot as plt

# Bar plot
sns.countplot(x='sex', data=tips)
plt.show()

import seaborn as sns
import matplotlib.pyplot as plt

# Histogram
sns.distplot(tips['total_bill'])
plt.show()

import seaborn as sns
import matplotlib.pyplot as plt

# Boxplot for tip by sex
sns.boxplot(x='sex', y='tip', data=tips)
plt.show()

import seaborn as sns
import matplotlib.pyplot as plt

# Scatter plot of total_bill and tip
sns.regplot(x='total_bill', y='tip', data=tips)
plt.show()

import seaborn as sns
import matplotlib.pyplot as plt

# Scatter plot of total_bill and tip faceted by smoker and colored by sex
sns.lmplot(x='total_bill', y='tip', data=tips, hue='sex', col='smoker')
plt.show()

import seaborn as sns
import matplotlib.pyplot as plt

# FacetGrid of time and smoker colored by sex
facet = sns.FacetGrid(tips, col='time', row='smoker', hue='sex')

# Map the scatter plot of total_bill and tip to the FacetGrid
facet.map(plt.scatter, 'total_bill', 'tip')
plt.show()

