# Foundations 1: Variables & Data Types
name = "Rudy"
age = 30
height = 5.11
is_student = True

print(name)
print(age)
print(height)
print(is_student)

print(type(name))	#<class 'str'>
print(type(age))	#<class 'int'>
print(type(height))	#<class 'float'>
print(type(is_student)) #<class 'bool'>

print(f"My name is {name} and I am {age} years old")
print (f"Is Rudy a student? {is_student}")
print(f"height: {height:1f} feet")

##challenge
car = "Range Rover"
model_year = 2012
mpg = 12.5
bad_gas_mileage = True

print(f"My {car} is the {model_year} model year that gets {mpg}mpg")
print(f"bad gas mileage: {bad_gas_mileage}")