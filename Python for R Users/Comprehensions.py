## Comprehensions

# map the binge_male function to num_drinks
print(list(map(binge_male, num_drinks)))

# map the binge_female function to num_drinks
print(list(map(binge_female, num_drinks)))

# Append dataframes into list with for loop
dfs_list = []
for f in inflam_files:
    dat = pd.read_csv(f)
    dfs_list.append(dat)

# Re-write the provided for loop as a list comprehension: dfs_comp

dfs_comp = []
dfs_comp = [pd.read_csv(f) for f in inflam_files]
print(dfs_comp)

# Write a dict comprehension
tf_dict = {key:value for key,value in twitter_followers}

# Print tf_dict
print(tf_dict)