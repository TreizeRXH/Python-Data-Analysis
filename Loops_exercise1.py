# Python Loops Exercises

#Challenge 1 — Create a list of 5 cars
#with their mpg and loop through printing
#good or bad mileage for each
	
cars = ["Range Rover", "Ferrari", "Toyota", "Porsche", "Honda"]
mpg = [12.5, 18.3, 35.7, 22.1, 40.5]
for car in cars:
	print(car)

# Print numbers 0 to 4
#for i in range(5):
#	print(f'\n{i}')
#
## Print numbers 1 to 5
#for j in range(1,6):
#	print(j)
#
##Count by 2s
#for l in range(0,10,2):
#	print(l)
#
## while loops
countdown = 5

while countdown > 0:
	print(f"Countdown: {countdown}")
	countdown -=1
	
print("Blast off!")
	
## Challenge 1 - Create these two lists
#and loop through printing good or bad
#mileage for each car 
print("=" * 32)
print('Challenge 1'.center(32))
print("=" * 32)

cars = ["Range Rover", "Ferrari", "Toyota", "Porsche", "Honda"]
mpg = [12.5, 18.3, 35.7, 22.1, 40.5]

print(f'\n--New Line to show list before ratings--')
for car, mileage in zip(cars, mpg): #zip pairs both lists together
	print(car, mileage) #loop for mpg ratings follows now

print(f'\n--Now show full list with mpg ratings--')	
for car, mileage in zip(cars, mpg):
	if mileage > 25: 
		rating = 'GOOD' 
	else:
		rating = "BAD"
	print(f"{car} - Gas mileage: {rating} ({mileage} mpg)")

	
print("=" * 32)
print('Challenge 2: Count to 10'.center(32))
print("=" * 32)

counter = 1
while counter <=10:
	print(f"Countup: {counter}")
	counter +=1
	
print(f"Congratulations, you've counted to 10")
