# Exercise 1 - Car Lot Inventory

cars = ["Range Rover", "Ferrari", "Toyota", "Porsche", "Honda"]
years = [2012, 2019, 2023, 2020, 2018]
prices = [45000, 120000, 25000, 95000, 18000]

#print header
print("=" *32)
print(f"CAR LOT INVENTORY".center(32))
print("=" *32)
#create list with cars, years, and prices formatted to dollars + decimals

for car, year, price in zip(cars, years, prices):
	print(f"{year} - {car} - ${price:,.2f}")
print("=" *32)
print(f"Total cars in stock: {len(cars)}")
print("=" *32)		


#Exercise 2 - Report Card

students = ["Rudy", "Maria", "James", "Sofia", "Carlos"]
scores = [
    [85, 92, 78, 95, 88],
    [72, 68, 75, 80, 71],
    [90, 95, 92, 88, 94],
    [55, 60, 48, 52, 59],
    [78, 82, 79, 85, 80]
]

def report_card(Students, Scores):
	average_score = avg{scores}
	for student, score in zip(students, scores):
		print()