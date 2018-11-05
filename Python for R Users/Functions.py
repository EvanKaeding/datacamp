# Binge status for males
def binge_male(num_drinks):
    if num_drinks <= 5:
        return ('non-binge')
    else:
        return('binge')
        
# Check
print(binge_male(6))

# Binge status for females
def binge_female(num_drinks):
    if num_drinks <= 4:
        return('non-binge')
    else:
        return('binge')

# Check
print(binge_female(2))

# A function that returns a binge status
def binge_status(sex, num_drinks):
    if sex == 'male':
        return binge_male(num_drinks)
    else:
        return binge_female(num_drinks)
		
# Male who had 5 drinks
print(binge_status('male', 5))

# Female who had 5 drinks
print(binge_status('female', 5))

#Lambda functions

# A function that takes a value and returns its square
def sq_func(x):
    return(x**2)
    
# A lambda function that takes a value and returns its square
sq_lambda = lambda x: x**2

# Use the lambda function
print(sq_lambda(3))