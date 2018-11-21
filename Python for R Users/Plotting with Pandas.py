#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Nov 11 18:00:22 2018

@author: evan
"""

'''
Plotting with Pandas
'''

import matplotlib.pyplot as plt

# Histogram of tip
tips['tip'].plot(kind='hist')
plt.show()

import matplotlib.pyplot as plt

# Boxplot of the tip column
tips['tip'].plot(kind = 'box')
plt.show()

import matplotlib.pyplot as plt

# Bar plot
cts = tips['sex'].value_counts()
cts.plot(kind = 'bar')
plt.show()

import matplotlib.pyplot as plt

# Bar plot
cts = tips['sex'].value_counts()
cts.plot(kind = 'bar')
plt.show()

import matplotlib.pyplot as plt

# Boxplot of the tip column by sex
tips.boxplot(column='tip', by='sex')
plt.show()

