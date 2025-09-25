import pandas as pd
import pymysql
from sqlalchemy import create_engine

# Load Excel file (fixing the missing closing parenthesis)
df = pd.read_excel("financial_loan.xlsx")

# Convert date columns to datetime format
date_cols = ['issue_date', 'last_credit_pull_date', 'last_payment_date', 'next_payment_date']
for col in date_cols:
    df[col] = pd.to_datetime(df[col], errors='coerce')

# Create SQLAlchemy engine using pymysql
engine = create_engine("mysql+pymysql://root:**********@localhost/bank_loan_db")

# Upload DataFrame to MySQL
df.to_sql(name='bank_loan_data', con=engine, if_exists='replace', index=False)

print("Data imported successfully")
