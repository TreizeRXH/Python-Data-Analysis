# Python & SQL Data Analysis Portfolio

## About
This repository documents my hands-on
training in Python and SQL for data
analysis. All exercises were completed
using real datasets and cover the core
skills required for a data analyst role.

## Technical Skills

### Python
- Data manipulation with Pandas
- Numerical computing with NumPy
- Data cleaning & wrangling
- Statistical analysis
- Visualization with Matplotlib & Seaborn

### SQL (MySQL)
- SELECT & filtering
- Aggregations & GROUP BY
- INNER & LEFT JOINs across multiple tables
- Subqueries & CTEs
- Date functions & string manipulation

## Repository Structure

### 📁 python/
Hands-on Python exercises covering
foundations through data analysis:

| File | Topics Covered |
|---|---|
| foundations1.py | Variables & data types |
| foundations2.py | Lists & indexing |
| foundations3.py | Functions & logic |
| foundations4.py | Loops & iteration |
| exercise1.py | Statistics with lists |
| exercise2.py | Pandas & CSV files |
| exercise3.py | Data cleaning & wrangling |
| exercise4.py | Statistics & outlier detection |
| functions_exercise2.py | Tip calculator |
| Functions_practice_exercise4.py | Hotel bill generator |
| Loops_exercise1.py | Car inventory loop |
| Loops_exercise2.py | Student report card |

### 📁 sql/
SQL queries written against the
MySQL Sakila sample database:

| File | Topics Covered |
|---|---|
| 01_select_filtering.sql | SELECT, WHERE, LIKE, COUNT |
| 02_aggregations_groupby.sql | SUM, AVG, GROUP BY, HAVING |
| 03_joins.sql | INNER JOIN, LEFT JOIN, multi-table JOINs |
| 04_subqueries_ctes.sql | Subqueries, CTEs, nested queries |

### 📁 data/
Sample datasets used in Python exercises:

| File | Description |
|---|---|
| sales_data.csv | Clean sales data for analysis |
| messy_sales.csv | Raw data with intentional quality issues |
| clean_sales.csv | Cleaned version of messy_sales.csv |
| sales_stats.csv | Extended sales data for statistical analysis |

## Key Projects & Findings

### Python Data Analysis
- Identified **Stationery** as the
best selling category by volume
(185 units vs 37 for Electronics)
- Detected and fixed 5 data quality
issues in messy dataset including
duplicates, missing values, and
inconsistent formatting
- Calculated correlation between
marketing spend and units sold

### SQL Analysis (Sakila Database)
- Identified **Sports** as the top
revenue generating film category
at $5,314.21
- Found **Gina Degeneres** as the
most prolific actor with 42 films
— 53.8% above the average of 27.31
- Discovered **Bucket Brotherhood**
as the most rented film with 30+
rentals
- Only 1 customer (Vanessa Sims)
made their first rental in July 2005

## Tools & Environment
- **Python** 3.14
- **Libraries:** pandas, numpy,
matplotlib, seaborn, scipy
- **Database:** MySQL 8.0
- **Sample Database:** Sakila
- **IDE:** CotEditor, MySQL Workbench
- **Version Control:** Git & GitHub
- **OS:** macOS

## How to Run Python Exercises
```bash
# Clone the repository
git clone https://github.com/TreizeRXH/python-data-analysis.git

# Navigate to project
cd python-data-analysis

# Create virtual environment
python3.14 -m venv venv
source venv/bin/activate

# Install dependencies
pip install pandas numpy matplotlib seaborn scipy

# Run an exercise
python python/exercise1.py
```

## How to Run SQL Queries
1. Install MySQL and download
the Sakila database from
dev.mysql.com/doc/index-other.html
2. Import sakila-schema.sql
3. Import sakila-data.sql
4. Open any .sql file in
MySQL Workbench and execute