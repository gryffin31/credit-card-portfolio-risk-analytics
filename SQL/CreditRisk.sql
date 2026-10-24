/*========================================================
  PROJECT: CREDIT CARD PORTFOLIO & RISK ANALYTICS
  DATABASE: CreditCardRiskDB

  SOURCE TABLES:
  Cust - Customer Details
  Prod - Credit Card Product Details
  Acct - Account Statement Snapshots
========================================================*/

CREATE DATABASE CreditCardRiskDB;
GO

USE CreditCardRiskDB;
GO


SELECT * FROM Cust;

SELECT * FROM Prod;

SELECT * FROM Acct;


--Cust — Column Names & Data Types

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Cust'
ORDER BY ORDINAL_POSITION;

--Prod — Column Names & Data Types

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Prod'
ORDER BY ORDINAL_POSITION;

--Acct — Column Names & Data Types

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Acct'
ORDER BY ORDINAL_POSITION;


SELECT
    'Cust' AS Table_Name,
    COUNT(*) AS Total_Rows,
    (SELECT COUNT(*)
     FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_NAME = 'Cust') AS Total_Columns
FROM Cust;

-------------------------------------------------------------------
-- Basic Data Exploration
-------------------------------------------------------------------

-- Total Customers
SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM Cust;

--Total_Customers
--2500

-- Total Transactions
SELECT COUNT(*) AS Total_Transactions
FROM Acct;

--Total_Transactions
--48000

-- Total Products
SELECT COUNT(DISTINCT Product_ID) AS Total_Products
FROM Prod;

--Total_Products
--5

-- Total Accounts
SELECT COUNT(DISTINCT Account_ID) AS Total_Accounts
FROM Acct;

--Total_Accounts
--4000

-- Categorical Data Exploration

-- 1. Distinct Gender Categories
SELECT DISTINCT
    GENDER
FROM Cust
ORDER BY GENDER;

--GENDER
--Female
--Male

-- 2. Distinct Marital Status Categories
SELECT DISTINCT
    MARITAL_STATUS
FROM Cust
ORDER BY MARITAL_STATUS;

--MARITAL_STATUS
--Married
--Single


-- 3. Distinct Cities
SELECT DISTINCT
    CITY
FROM Cust
ORDER BY CITY;

--CITY
--Bengaluru
--Chennai
--Coimbatore
--Hyderabad
--Mumbai
--Mysuru
--New Delhi
--Pune
--Warangal


-- 4. Distinct Occupation Categories
SELECT DISTINCT
    OCCUPATION
FROM Cust
ORDER BY OCCUPATION;

--OCCUPATION
--Business
--Government
--Salaried
--Self Employed
--Student


/*========================================================
  1. CUSTOMER FEATURE ENGINEERING
========================================================*/

--========================================================
-- 1. CREATE AGE COLUMN
--========================================================

ALTER TABLE Cust
ADD Age INT;

SELECT * FROM Cust;


--Calculate Age

UPDATE Cust
SET Age = DATEDIFF(YEAR, DOB, GETDATE());

SELECT * FROM Cust;

--========================================================
-- 2. ANALYSE AGE BY OCCUPATION
--========================================================

SELECT
    Occupation,
    MAX(Age) AS Max_Age,
    MIN(Age) AS Min_Age
FROM Cust
GROUP BY Occupation;

--========================================================
-- 3. CREATE CREDIT SCORE SEGMENT
--========================================================

-- CREDIT SEGMENT

ALTER TABLE Cust
ADD Credit_Segment VARCHAR(20);

UPDATE Cust
SET Credit_Segment = CASE
    WHEN Credit_Score < 600 THEN '<600'
    WHEN Credit_Score < 700 THEN '600-700'
    WHEN Credit_Score < 800 THEN '700-800'
    ELSE '800>'
END;

--========================================================
-- 4. CREATE AGE AND SALARY SEGMENTS
--========================================================

-- AGE SEGMENT AND SALARY SEGMENT

ALTER TABLE Cust
ADD Age_Segment VARCHAR(20),
    Salary_Segment VARCHAR(20);

UPDATE Cust
SET Age_Segment = CASE
    WHEN Age <= 25 THEN '18-25'
    WHEN Age <= 35 THEN '26-35'
    WHEN Age <= 45 THEN '36-45'
    WHEN Age <= 55 THEN '46-55'
    ELSE '55+'
END;

UPDATE Cust
SET Salary_Segment = CASE
    WHEN Annual_Income < 500000 THEN 'Low'
    WHEN Annual_Income < 1000000 THEN 'Medium'
    WHEN Annual_Income < 2000000 THEN 'High'
    ELSE 'Premium'
END;

--========================================================
-- 5. CORRECT EMPLOYMENT YEARS FOR STUDENTS
--========================================================

UPDATE Cust
SET Employment_Years = 1
WHERE Occupation = 'Student';

--========================================================
-- 6. CHECK ACCOUNT TABLE STRUCTURE
--========================================================

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Acct';

SELECT *
FROM Acct
WHERE Payment_Date IS NULL;

SELECT *
FROM Acct;

--========================================================
-- 7. CALCULATE DAYS PAST DUE (DPD)
--========================================================

-- DPD

ALTER TABLE Acct
ADD DPD INT;

UPDATE Acct
SET DPD = CASE
    WHEN Payment_Date IS NULL
        THEN DATEDIFF(DAY, Due_Date, GETDATE())
    WHEN Payment_Date <= Due_Date THEN 0
    ELSE DATEDIFF(DAY, Due_Date, Payment_Date)
END;

--========================================================
-- 8. CREATE DELINQUENCY BUCKET
--========================================================

-- DELINQUENCY BUCKET

ALTER TABLE Acct
ADD Delinquency_Bucket VARCHAR(10);

UPDATE Acct
SET Delinquency_Bucket = CASE
    WHEN DPD = 0 THEN 'Current'
    WHEN DPD <= 30 THEN '1-30'
    WHEN DPD <= 60 THEN '31-60'
    WHEN DPD <= 90 THEN '61-90'
    ELSE '90+'
END;


--========================================================
-- 9. CREATE PAYMENT STATUS
--========================================================

-- PAYMENT STATUS

ALTER TABLE Acct
ADD Payment_Status VARCHAR(10);

UPDATE Acct
SET Payment_Status = CASE
    WHEN Amount_Paid IS NULL THEN 'NOT PAID'
    ELSE 'PAID'
END;

--========================================================
-- 10. CREATE PAYMENT BEHAVIOUR
--========================================================


-- PAYMENT BEHAVIOUR

ALTER TABLE Acct
ADD Payment_Behaviour VARCHAR(30);

UPDATE Acct
SET Payment_Behaviour = CASE
    WHEN Amount_Paid IS NULL OR Amount_Paid = 0
        THEN 'No Payment'
    WHEN Amount_Paid < Minimum_Due
        THEN 'Below Minimum Due'
    WHEN Amount_Paid = Minimum_Due
        THEN 'Minimum Due Paid'
    WHEN Amount_Paid > Minimum_Due
         AND Amount_Paid < Outstanding_Balance
        THEN 'Above Minimum Due'
    WHEN Amount_Paid >= Outstanding_Balance
        THEN 'Full Payment'
END;

--========================================================
-- 11. CREATE CUSTOMER REPAYMENT SEGMENT
--========================================================

-- CUSTOMER SEGMENT

ALTER TABLE Acct
ADD Customer_Segment VARCHAR(30);

UPDATE Acct
SET Customer_Segment = CASE
    WHEN Amount_Paid >= Outstanding_Balance
        THEN 'Transactor'
    WHEN Amount_Paid >= Minimum_Due
         AND Amount_Paid < Outstanding_Balance
        THEN 'Revolver'
    WHEN Amount_Paid > 0
         AND Amount_Paid < Minimum_Due
        THEN 'Delinquent'
    WHEN Amount_Paid IS NULL OR Amount_Paid = 0
        THEN 'No Payment'
END;

--========================================================
-- 12. CALCULATE MONTHS ON BOOK (MOB)
--========================================================


-- MOB

ALTER TABLE Acct
ADD MOB INT;

UPDATE Acct
SET MOB = DATEDIFF(MONTH, Account_Open_Date, Statement_Date) + 1;

--========================================================
-- 13. CALCULATE UTILIZATION RATE AND BUCKET
--========================================================

-- UTILIZATION RATE AND BUCKET

ALTER TABLE Acct
ADD Utilization_Rate NVARCHAR(20),
    Utilization_Bucket VARCHAR(20);

UPDATE Acct
SET Utilization_Rate = FORMAT(
    Outstanding_Balance / NULLIF(Credit_Limit, 0),
    'P2'
);

UPDATE Acct
SET Utilization_Bucket = CASE
    WHEN Outstanding_Balance = 0 THEN 'No Usage'
    WHEN Outstanding_Balance * 100.0 / NULLIF(Credit_Limit, 0) <= 10 THEN '0-10%'
    WHEN Outstanding_Balance * 100.0 / NULLIF(Credit_Limit, 0) <= 30 THEN '10-30%'
    WHEN Outstanding_Balance * 100.0 / NULLIF(Credit_Limit, 0) <= 50 THEN '30-50%'
    WHEN Outstanding_Balance * 100.0 / NULLIF(Credit_Limit, 0) <= 75 THEN '50-75%'
    WHEN Outstanding_Balance * 100.0 / NULLIF(Credit_Limit, 0) <= 90 THEN '75-90%'
    ELSE '>90%'
END;

--========================================================
-- 14. CREATE CHARGE-OFF FLAG
--========================================================

-- CHARGEOFF FLAG

ALTER TABLE Acct
ADD Chargeoff_Flag BIT;

UPDATE Acct
SET Chargeoff_Flag = CASE
    WHEN DPD > 90 THEN 1
    ELSE 0
END;

--========================================================
-- 15. TRACK PREVIOUS-MONTH DELINQUENCY
--========================================================

-- PREVIOUS MONTH DPD

ALTER TABLE Acct
ADD Prev_Month_DPD VARCHAR(20);


WITH RollRate AS
(
    SELECT
        Account_ID,
        Statement_Date,
        LAG(Delinquency_Bucket, 1) OVER
        (
            PARTITION BY Account_ID
            ORDER BY Statement_Date
        ) AS Previous_Delinquency_Bucket
    FROM Acct
)
UPDATE A
SET Prev_Month_DPD = R.Previous_Delinquency_Bucket
FROM Acct A
INNER JOIN RollRate R
    ON A.Account_ID = R.Account_ID
    AND A.Statement_Date = R.Statement_Date;


    -- CREATE VIEWS FOR ALL 3 TABLES

CREATE VIEW CUSTOMERS_INFO
AS
SELECT *
FROM Cust;

---------------------

CREATE VIEW TRANSACTION_INFO
AS
SELECT *
FROM Acct;

---------------------

CREATE VIEW PRODUCT_INFO
AS
SELECT *
FROM Prod;

-- SELECT CUSTOMERS VIEW
SELECT *
FROM CUSTOMERS_INFO;

-- SELECT TRANSACTION VIEW
SELECT *
FROM TRANSACTION_INFO;

-- SELECT PRODUCT VIEW
SELECT *
FROM PRODUCT_INFO;

-- CHECK ROWS AND COLUMNS FOR ALL 3 VIEWS

SELECT
    'CUSTOMERS_INFO' AS View_Name,
    (SELECT COUNT(*) FROM CUSTOMERS_INFO) AS Total_Rows,
    (SELECT COUNT(*)
     FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_NAME = 'CUSTOMERS_INFO') AS Total_Columns

UNION ALL

SELECT
    'TRANSACTION_INFO',
    (SELECT COUNT(*) FROM TRANSACTION_INFO),
    (SELECT COUNT(*)
     FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_NAME = 'TRANSACTION_INFO')

UNION ALL

SELECT
    'PRODUCT_INFO',
    (SELECT COUNT(*) FROM PRODUCT_INFO),
    (SELECT COUNT(*)
     FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_NAME = 'PRODUCT_INFO');