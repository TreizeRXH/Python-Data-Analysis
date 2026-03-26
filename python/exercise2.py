# Exercise 2:  Pandas & CSV Files
import pandas as pd

# Load the CSV
df = pd.read_csv("sales_data.csv")

# Explore the data
print("First 5 rows:")
print(df.head())

print("\n Shape (rows, columns):")
print(df.shape)

print("\n Column names & data types:")
print(df.dtypes)

print("\n Summary statistics:")
print(df.describe())

# Challenge 1: Add revenue column (units_sold × price_per_unit)
df["revenue"] = df["units_sold"] * df["price_per_unit"]

print("\n Data with Revenue column:")
print(df)

# Challenge 2: Total revenue
total_revenue = df["revenue"].sum()
print(f"\n Total revenue: ${total_revenue:,.2f}")

# Challenge 3:  Best selling category
category_sales = df.groupby("category")["units_sold"].sum()
best_category = category_sales.idxmax()

print("\n Units sold by category:")
print(category_sales)
print(f"\n Best selling category: {best_category}")

