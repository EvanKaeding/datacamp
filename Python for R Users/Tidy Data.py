#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Nov 11 16:31:03 2018

@author: evan
"""

   # Mean tip by sex
print(tips.groupby('sex')['tip'].mean())

# Mean tip by sex and time
print(tips.groupby(['sex', 'time'])['tip'].mean())

# Melt the airquality DataFrame
airquality_melted = pd.melt(airquality, id_vars=['Day', 'Month'])
print(airquality_melted)

# Pivot the molten DataFrame
airquality_pivoted = airquality_melted.pivot_table(index=['Month', 'Day'], columns='variable', values='value')
print(airquality_pivoted)

# Reset the index
print(airquality_pivoted.reset_index())