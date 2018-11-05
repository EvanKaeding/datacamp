## Pandas

# Print the tip column using dot notation
print(tips.tip)

print(tips.head(5))

print(tips.tail(5))

# Print the tip column using dot notation
print(tips.tip)

# Print the sex column using square bracket notation
print(tips['sex'])

# Print the tip column using dot notation
print(tips.tip)

# Print the sex column using square bracket notation
print(tips['sex'])

# Print the tip and sex columns
print(tips[['tip', 'sex']])

# Print the first row of tips using iloc
print(tips.iloc[0])

# Print all the rows where sex is Female
print(tips.loc[tips.sex == 'Female'])

# Print all the rows where sex is Female and total_bill is greater than 15
print(tips.loc[(tips.sex == 'Female') & (tips.total_bill > 15)])

# Subset rows and columns
print(tips.loc[tips['sex'] == 'Female', ['total_bill', 'tip', 'sex']])

# 3 rows and 3 columns with iloc
print(tips.iloc[0:3, 0:3])

# Convert the size column
tips['size'] = tips['size'].astype(int)

# Convert the tip column
tips['tip'] = tips['tip'].astype(float)

# Look at the types
print(tips.dtypes)

# Convert sex to lower case
tips['sex'] = tips['sex'].str.lower()

# Convert smoker to upper case
tips['smoker'] = tips['smoker'].str.upper()

# Print the sex and smoker columns
print(tips[['sex', 'smoker']])

