# Functions exercise 1: Temperature Converter
print(f'\nTemperature Converter')

def temperature_converter(fahrenheit):
	celsius = (fahrenheit - 32) * 5/9
	print(f"{fahrenheit}°F = {celsius}°C")
	
temperature_converter(32)
temperature_converter(98.6)
temperature_converter(212)


# Functions exercise 2:  Tip Calculator
print(f'\nTip Calculator')
def tip_calculator(bill_amount, service_rating):
	if service_rating == "poor":
		tip_percent = 0.10
	elif service_rating == "good":
		tip_percent = 0.18
	elif service_rating == "excellent":
		tip_percent = 0.25
	tip_amount = bill_amount * tip_percent
	total = bill_amount + tip_amount
	print(f"Bill: ${bill_amount:.2f} | Tip ({service_rating}): ${tip_amount:.2f} | Total: ${total:.2f}")
		
	
tip_calculator(85.00, "poor")
tip_calculator(120.00, "good")
tip_calculator(200.00, "excellent")


# Exercse 3:  Grade Calculators
print(f'\nGrade Calculator')

def grade_calculator(student, scores):
	average = sum(scores)/len(scores)
	if average >= 90:
		grade = 'A'
	elif average >= 80 and average < 90:
		grade = 'B'
	elif average >= 70 and average < 80:
		grade = 'C'
	elif average >= 60 and average < 70:
		grade = 'D'
	else:
		 grade = 'F'
		
	print(f"\nStudent: {student}")
	print(f"Scores: {scores}")
	print(f"Average: {average:.1f}")
	print(f"Grade: {grade}")
	
grade_calculator("Rudy", [85, 92, 78, 95, 88])
grade_calculator("Maria", [72, 68, 75, 80, 71])
grade_calculator("James", [55, 60, 48, 52, 59])
	