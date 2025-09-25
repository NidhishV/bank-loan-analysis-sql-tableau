# Bank Loan Portfolio Analysis & Risk Insights
[![Screenshot-2025-09-25-at-11-34-28-PM.png](https://i.postimg.cc/dVKKCr6V/Screenshot-2025-09-25-at-11-34-28-PM.png)](https://postimg.cc/xcg7DkBw)
## Project Overview
The **Bank Loan Report** is a comprehensive analytical dashboard built to monitor and assess a bank's lending activities and portfolio performance.  
It provides insights into loan applications, disbursements, repayments, and borrower financial health through **KPIs, trend analysis, and interactive visualizations**.  

This project was implemented in **Tableau** (primary tool), with SQL scripts for data analysis and python for connection handling.  

---

## Problem Statement
Banks need a **centralized reporting system** to track loan performance and borrower risk profiles.  
The objective of this project is to:  
- Track loan applications, funded amounts, and repayments.  
- Monitor **borrower financial health** using metrics like **Average Interest Rate** and **Debt-to-Income Ratio (DTI)**.  
- Distinguish between **Good Loans (Fully Paid, Current)** and **Bad Loans (Charged Off)**.  
- Provide **interactive dashboards** to support data-driven decision-making.  

---

## Dataset
- **File**: `loan_default_predictions.csv`  
- **Size**: 7,716 rows × 4 columns  
- **Fields**:
  - `loan_id` → Unique identifier for each loan application  
  - `actual_status` → True loan status (1 = Default, 0 = Non-default)  
  - `predicted_status` → Model’s predicted status (1 = Default, 0 = Non-default)  
  - `default_probability` → Probability that the loan will default  

- **Preprocessing Steps**:
  - Verified data consistency (loan IDs are unique).  
  - Standardized binary classification labels (0 = Non-default, 1 = Default).  
  - Used probability scores for model evaluation and KPI tracking.  

---

## Key Features

### Dashboard 1: Summary
- Total Loan Applications (Overall, MTD, MoM)  
- Total Funded Amount (Overall, MTD, MoM)  
- Total Amount Received (Overall, MTD, MoM)  
- Average Interest Rate (Overall, MTD, MoM)  
- Average Debt-to-Income Ratio (DTI) (Overall, MTD, MoM)

[![summary.png](https://i.postimg.cc/Fz1Rk39K/summary.png)](https://postimg.cc/jn0KGWnV) 

### Good Loan vs Bad Loan KPIs
- % of Good Loans vs Bad Loans  
- Good/Bad Loan Applications  
- Good/Bad Loan Funded Amount  
- Good/Bad Loan Total Amount Received  

### Dashboard 2: Overview
- **Monthly Trends (Line Chart)** – Loan Applications, Funded Amount, Amount Received  
- **Regional Analysis (Map)** – Lending metrics by state  
- **Loan Term Analysis (Donut Chart)** – Distribution by 36/60 month terms  
- **Employment Length Analysis (Bar Chart)** – Lending by borrower job tenure  
- **Loan Purpose Breakdown (Bar Chart)** – Loan purposes like debt consolidation, refinancing  
- **Home Ownership Analysis (Tree Map)** – Loan distribution by ownership type

[![overview.png](https://i.postimg.cc/JzjhX1Wj/overview.png)](https://postimg.cc/CRLYTp5K)

### Dashboard 3: Details
- Grid view of loan portfolio by **Loan Status**  
- Metrics: Loan Applications, Funded Amount, Amount Received, Avg Interest Rate, Avg DTI  
- Borrower-level insights and repayment history

[![details.png](https://i.postimg.cc/nVs9zfMG/details.png)](https://postimg.cc/Lhp8C7tJ)

---

## Tools & Technologies
- **Power BI** → Dashboard creation & visualization  
- **SQL (MySQL)** → Data extraction and transformation  
- **Python** → Database connection (`db_connection.py`)  
- **CSV** → Data preprocessing  

---

## Scripts
- **db_connection.py** → Establishes database connection and fetches loan data.  
- **loan_analysis_queries.sql** → SQL queries for extracting KPIs and metrics.
