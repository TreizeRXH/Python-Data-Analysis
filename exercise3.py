# Exercise 3:  data Cleaning & Wrangling
import pandas as pd

# Load the messy CSV
df = pd.read_csv("messy_sales.csv")
rows_before = len(df) # <- to capture row count before cleanup

print (" Raw Data")
print(df)

#--- PROBLEM 1:  Duplicate rows ---
print(f"\n Duplicates Found: {df.duplicated().sum()}")
df = df.drop_duplicates()
print(f"\n Duplicates removed.  Rows remaining: {len(df)}")

#--- PROBLEM 2:  Missing Values ---
print(f"\n? Missing Values per Column:")
print(df.isnull().sum())

# Fill missing units_sold with median
df["units_sold"] = pd.to_numeric(df["units_sold"], errors="coerce")
median_units = df["units_sold"].median()
df["units_sold"] = df["units_sold"].fillna(median_units)

# Fill missing price_per_unit with median
df["price_per_unit"] = pd.to_numeric(df["price_per_unit"], errors="coerce")
median_price = df["price_per_unit"].median()
df["price_per_unit"] = df["price_per_unit"].fillna(median_price)

print(f"\n Missing values after fix:")
print(df.isnull().sum())

# --- PROBLEM 3: Inconsistent category casing ---
print(f"\n Unique categories before fix: {df['category'].unique()}")
df["category"] = df["category"].str.title()
print(f" Unique categories after fix: {df['category'].unique()}")

# --- PROBLEM 4: Wrong data type (units_sold stored as text)
print(f"\n Data types after cleaning:")
print(df.dtypes)

# --- Final cleaned data ---
print("\n Cleaned dataset:")
print(df)


# --- Exercise Challenge 1:  Add revenue columns --
df["revenue"] = df["units_sold"] * df["price_per_unit"]
df["revenue"] = df["revenue"].round(2)
print("\n Data with Revenue column:")
print(df)

# --- Exercise Challenge 2: print row count before and after cleaning
rows_after = len(df)
print(f"\n Row count before cleaning: {rows_before}")
print(f"\n Row count after cleaning: {rows_after}")
print(f" Rows removed: {rows_before - rows_after}")

df.to_csv("clean_sales.csv", index=False)
print("\n Cleaned data saved to clean_sales.csv")
