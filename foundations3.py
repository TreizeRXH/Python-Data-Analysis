# Foundations 3: Functions

# --- Challenge

def greet(name):
	print(f"hello {name}!")

greet("Rudy")


def car_summary(name, year, mpg):
	if mpg > 25: 
		rating = 'GOOD' 
	else:
		rating = "BAD"
	print(f"{year} {name} - Gas mileage: {rating} ({mpg} mpg)")
car_summary("Range Rover", 2012, 12.5)
car_summary("Ferarri", 2014, 18.3)
car_summary("Toyota", 2020, 35.7)	

