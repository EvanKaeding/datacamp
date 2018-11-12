#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Nov 11 16:23:06 2018

@author: evan
"""

# Print the rows where total_bill is missing
print(tips.loc[pd.isnull(tips['total_bill'])])

# Mean of the total_bill column
tbill_mean = tips['total_bill'].mean()

# Fill in missing total_bill
print(tips['total_bill'].fillna(tips['total_bill'].mean()))