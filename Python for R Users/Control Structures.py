# Assign 5 to a variable
num_drinks = 5

# if statement
if num_drinks < 0:
    print('error')
# elif statement
elif num_drinks <= 4:
    print('non-binge')
# else statement
else:
    print('binge')
	
num_drinks = [5, 4, 3, 3, 3, 5, 6, 10]

# Write a for loop
for drink in num_drinks:
    # if/else statement
    if drink <= 4:
        print('non-binge')
    else:
        print('binge')
		
