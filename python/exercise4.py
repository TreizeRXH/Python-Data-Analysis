# Exercise 4:  Statistics & Analysis
import pandas as pd

df = pd.read_csv("Sales_stats.csv")

# Add revenue column
df["revenue"] = (df["units_sold"] * df["price_per_unit"]).round(2)

# --- SECTION 1:  Descriptive Statistics ---
print(" Descriptive Statistics:")
print(df[["units_sold", "price_per_unit", "revenue", "marketing_spend"]].describe())

# --- SECTION 2: Statistics by Category ---
print("\n Average revenue by category:")
print(df.groupby("category")["revenue"].sum().round(2))

# --- SECTION 3: Correlation ---
print("\n Correlation between marketing spend and units sold:")
correlation = df["marketing_spend"].corr(df["units_sold"])
print(f"Correlation coefficient: {correlation:.2f}")

# --- SECTION 4: Outliers ---
mean_units = df["units_sold"].mean()
std_units = df["units_sold"].std()

print("f\n Outlier detection for units_sold:")
print(f"Mean: {mean_units:.2f} | Std Dev: {std_units:.2f}")

outliers = df[df["units_sold"] > mean_units + 2 * std_units]
print("f\n Outliers (unusually high units sold):")
print(outliers[["product", "category", "units_sold"]])

# --- Challenge 1:  Find the month with the highest total revenue
# Right now the date column is just text like "2024-01-05". Python can't do math on text, so 
# first we convert it to a real date and pull out just the month number
df["month"] = pd.to_datetime(df["date"]).dt.month
# this adds a new column called month with values 1 for January and 2 for February

#step 2 - Group by month and sum revenue
monthly_revenue = df.groupby("month")["revenue"].sum().round(2)
best_month = monthly_revenue.idxmax()
print(f"\n Best month: Month {best_month} with ${monthly_revenue[best_month]:,.2f}")

# --- Challeng 2: Print the top 3 products by total revenue:
# group data by product
product_revenue = df.groupby("product")["revenue"].sum().round(2)
print(product_revenue)