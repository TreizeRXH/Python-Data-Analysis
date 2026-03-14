# Foundations 2: Lists
cars = ["Range Rover", "Ferrari", "Toyota"]

print (cars)
print(type(cars))
print(len(cars))

## Step 2 - Accessing items by index

print(cars[0])
print(cars[1])
print(cars[2])
print(cars[-1])
print(cars[-2])

#Step 3 - Modifying Lists
# Add an item to the end
cars.append("Porsche")
print(cars)

# Remove an item
cars.remove("Ferrari")
print(cars)

#Step4 - Slicing

print(cars[0:2])	# first 2 items
print(cars[1:3])	# items at index 1 and 2
print(cars[:2])		# everything up to index 2
print(cars[2:])		# everything from index 2 onwards

# -- CHALLENGE:  Create a list of 5 of your favorite cars
#print full list
Fav_cars = ["Range Rover", "Audi", "Jaguar", "Aston Martin", "Porsche"]
print(Fav_cars)

#print the first and last car using index
print(Fav_cars[0])
print(Fav_cars[-1])

#add a 6th car
Fav_cars.append("Honda")
print(Fav_cars)

#Remove one car using .remove
Fav_cars.remove("Aston Martin")
print(Fav_cars)
