# Exercise 1:  Working with lists and functions

numbers = [23, 45, 12, 67, 34, 89, 56, 11, 78, 42, 69, 17, 1]

def calculate_average(data):
	total = sum(data)
	count = len(data)
	return total/count

def summarize(data):
	print("Data Summary")
	print("-" * 25)
	print(f"Numbers: 	{data}")
	print(f"Count:		{len(data)}")
	print(f"Average:	{calculate_average(data):.2f}")
	print(f"Minimum:	{min(data)}")
	print(f"Maximum:	{max(data)}")
	print(f"Range:		{max(data)-min(data)}")
	sorted_data = sorted(data)
	midpoint = len(sorted_data)//2
	print(f"Median:		{sorted_data[midpoint]}")

summarize(numbers)