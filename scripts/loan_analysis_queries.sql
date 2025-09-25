USE bank_loan_db;

SELECT COUNT(*) FROM bank_loan_data;

SELECT * FROM bank_loan_data;

-- checking if id column is unique
SELECT id, COUNT(*) AS count
FROM bank_loan_data
GROUP BY id
HAVING count > 1;

-- Setting id as Primary Key
ALTER TABLE bank_loan_data 
ADD PRIMARY KEY (id);

ALTER TABLE bank_loan_data
MODIFY COLUMN address_state VARCHAR(50),
MODIFY COLUMN application_type VARCHAR(50),
MODIFY COLUMN emp_length VARCHAR(50),
MODIFY COLUMN emp_title VARCHAR(100),
MODIFY COLUMN grade VARCHAR(50),
MODIFY COLUMN home_ownership VARCHAR(50),
MODIFY COLUMN issue_date DATE,
MODIFY COLUMN last_credit_pull_date DATE,
MODIFY COLUMN last_payment_date DATE,
MODIFY COLUMN loan_status VARCHAR(50),
MODIFY COLUMN next_payment_date DATE,
MODIFY COLUMN member_id INT,
MODIFY COLUMN purpose VARCHAR(50),
MODIFY COLUMN sub_grade VARCHAR(50),
MODIFY COLUMN term VARCHAR(15),
MODIFY COLUMN verification_status VARCHAR(50),
MODIFY COLUMN annual_income FLOAT,
MODIFY COLUMN dti FLOAT,
MODIFY COLUMN installment FLOAT,
MODIFY COLUMN int_rate FLOAT,
MODIFY COLUMN loan_amount BIGINT,
MODIFY COLUMN total_acc BIGINT,
MODIFY COLUMN total_payment BIGINT;

-- COUNT of Total Loan App lications
SELECT COUNT(id) AS Total_Loan_Applications FROM bank_loan_data;

-- COUNT for December 2021
SELECT COUNT(id) AS MTD_Total_Loan_Applications
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- COUNT for November 2021
SELECT COUNT(id) AS PMTD_Total_Loan_Applications
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Finding % increase or % decrease -- Month on Month applications 
-- (MTD-PMTD)/PMTD

-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data;

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Total payment recieved back from the customer 
SELECT SUM(total_payment) AS Total_Amount_Recieved FROM bank_loan_data;

SELECT SUM(total_payment) AS MTD_Total_Amount_Recieved FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT SUM(total_payment) AS PMTD_Total_Amount_Recieved FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Calculating AVG interest rate applied by bank in % rounding to two decimal places 
SELECT ROUND(AVG(int_rate), 4) * 100 AS Avg_Interest_Rate 
FROM bank_loan_data;


SELECT ROUND(AVG(int_rate), 4) * 100 AS MTD_Avg_Interest_Rate 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;


SELECT ROUND(AVG(int_rate), 4) * 100 AS PMTD_Avg_Interest_Rate 
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Average Debt-to-Income Ratio (DTI):
SELECT ROUND(AVG(dti),4) * 100 AS Avg_DTI FROM bank_loan_data;

-- Average Debt-to-Income Ratio (DTI) FOR month of dec:
SELECT ROUND(AVG(dti),4) * 100 AS Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;


SELECT ROUND(AVG(dti),4) * 100 AS Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;


-- Selecting Good and bad loan  -- 

SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
    /
    COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data;


-- Find out no. of good loan applications 
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';


-- Good loan funded amount 
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good loan total recieved amount 
SELECT SUM(total_payment) AS Good_Loan_Recieved_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';


-- Total percentage of Bad loan 
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data;

SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off';

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off';

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off';


-- LOAN STATUS
SELECT
        loan_status,
        COUNT(id) AS Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status;
        
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status;

        

-- B.	BANK LOAN REPORT | OVERVIEW
-- MONTH
SELECT 
	MONTH(issue_date) AS Month_Number, 
	MONTHNAME(issue_date) AS Month_Name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);

-- STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state;


-- TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term;

-- EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;


-- PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose;


-- HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership;











