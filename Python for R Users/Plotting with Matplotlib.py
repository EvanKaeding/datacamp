#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Nov 11 18:51:31 2018

@author: evan
"""

import matplotlib.pyplot as plt

# Univariate histogram
plt.hist(tips['total_bill'])
plt.show()

import matplotlib.pyplot as plt

# Bivariate scatterplot
plt.scatter(tips['tip'], tips['total_bill'])
plt.show()

import matplotlib.pyplot as plt

# Bivariate scatterplot
plt.scatter(tips['tip'], tips['total_bill'])
plt.show()

import matplotlib.pyplot as plt

# Bivariate scatterplot
plt.scatter(tips['tip'], tips['total_bill'])
plt.show()

import matplotlib.pyplot as plt

# Create a figure with scatter plot and histogram
fig, (ax1, ax2) = plt.subplots(1, 2)
ax1.scatter(tips['tip'], tips['total_bill'])
ax2.hist(tips['total_bill'])
plt.show()

# Distplot of tip
import seaborn as sns
dis = sns.distplot(tips['tip'])

# Print the type
print(type(dis))

# Figure with 2 axes: regplot and distplot
fig, (ax1, ax2) = plt.subplots(1,2)
sns.distplot(tips['tip'], ax=ax1)
sns.regplot(x='total_bill', y='tip', data=tips, ax=ax2)
plt.show()

import matplotlib.pyplot as plt
import seaborn as sns

# Create a figure with 1 axes
fig, ax = plt.subplots()

# Draw a displot
ax = sns.distplot(tips['total_bill'])

# Label the title and x axis
ax.set_title('Histogram')
ax.set_xlabel('Total Bill')
plt.show()