# 💳 Credit Card Portfolio & Risk Analytics

<p align="center">
  <img src="https://img.shields.io/badge/SQL%20Server-Database%20Analysis-161E54?style=for-the-badge&logo=microsoftsqlserver&logoColor=white" alt="SQL Server"/>
  <img src="https://img.shields.io/badge/Python-Data%20Analysis-359FA0?style=for-the-badge&logo=python&logoColor=white" alt="Python"/>
  <img src="https://img.shields.io/badge/Pandas-Data%20Manipulation-F16D34?style=for-the-badge&logo=pandas&logoColor=white" alt="Pandas"/>
  <img src="https://img.shields.io/badge/Status-Analysis%20Complete-2E8B57?style=for-the-badge" alt="Analysis status"/>
</p>

<p align="center">
  <b>Exploring customer behaviour, credit utilization, payment patterns, and portfolio risk through SQL and Python.</b>
</p>

---

## 📌 Project Overview

Credit card portfolio management requires a clear understanding of customer characteristics, account activity, repayment behaviour, and outstanding balances. This project analyses a credit card portfolio using SQL Server and Python to uncover patterns that can support portfolio monitoring and risk assessment.

The analysis combines SQL-based data exploration with Python statistical analysis and visualizations to examine customer demographics, credit scores, card products, utilization levels, payment behaviour, and charge-off indicators.

### 🎯 Project Objectives

- Analyse customer and account portfolio characteristics.
- Examine credit score, salary, and age distributions.
- Evaluate credit utilization and outstanding balances.
- Investigate payment behaviour and delinquency indicators.
- Compare portfolio metrics across card products and customer segments.
- Translate analytical findings into practical business observations.

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| SQL Server | Data exploration, querying, aggregations, and business analysis |
| Python | Statistical analysis and exploratory data analysis |
| Pandas | Data manipulation and analysis |
| Matplotlib | Data visualization |
| Seaborn | Statistical charts and distribution analysis |
| Jupyter Notebook | Interactive Python analysis |

## 📊 Portfolio Snapshot

The analysis covers the following portfolio metrics:

| Metric | Result |
|---|---:|
| Total Customers | 2,500 |
| Total Accounts | 4,000 |
| Account Statement Records | 48,000 |
| Card Product Categories | 5 |
| Average Credit Utilization | 30.41% |
| Unpaid Statement Records | 1,453 |
| Records with DPD Above 90 Days | 3,259 |
| Charge-Off-Flagged Records | 3,259 |

These figures provide an overview of the dataset analysed. Customer counts, account counts, and statement-level counts represent different levels of the portfolio and should not be treated as interchangeable.

## 📈 Key Statistical Findings

### 1. Credit Score Distribution

| Credit Score Band | Share |
|---|---:|
| 700–800 | 28.60% |
| 800+ | 28.52% |
| 600–700 | 27.88% |
| Below 600 | 15.00% |

**Business observation:** Customers in the 700-and-above score bands account for the largest combined share of the portfolio. The 15% share below 600 identifies a segment worth examining more closely for repayment behaviour and exposure.

### 2. Customer Demographics

**Age distribution**

| Age Group | Share |
|---|---:|
| 55+ | 24.44% |
| 46–55 | 23.09% |

**Salary segmentation**

| Salary Segment | Share |
|---|---:|
| High | 37.28% |
| Premium | 35.40% |

**Business observation:** The 46-and-above age groups represent substantial portions of the analysed customer base. High and Premium salary categories also make up a large combined share. Further comparisons with utilization and repayment behaviour could help identify differences between these segments.

### 3. Payment Behaviour

| Payment Behaviour Category | Share |
|---|---:|
| Above Minimum Due | 80.99% |
| Below Minimum Due | 15.39% |
| No Payment | 3.63% |

**Business observation:** Most records fall into the Above Minimum Due category. The Below Minimum Due and No Payment groups warrant closer monitoring because repayment shortfalls can indicate potential financial stress.

*Note: These percentages are based on the categories and calculations in the analysis. Confirm the underlying definitions and denominator before interpreting them as unique-customer percentages.*

### 4. Customer Segment Distribution

| Customer Segment | Share |
|---|---:|
| Revolver | 80.99% |
| Delinquent | 15.39% |
| No Payment | 3.03% |
| Transactor | 0.60% |

**Business observation:** The Revolver segment dominates the reported distribution. The delinquent and no-payment segments may require additional analysis of outstanding balances, utilization, and payment history.

*Note: Validate the segment definitions and category totals against the source data before using these values for business decisions.*

### 5. Credit Utilization Analysis

| Utilization Band | Share |
|---|---:|
| 0–10% | 24.63% |
| 10–30% | 41.64% |
| 30–50% | 15.95% |
| 50–75% | 8.84% |
| 75–90% | 2.50% |
| Above 90% | 5.82% |
| No Usage | 0.62% |

**Business observation:** The 10–30% utilization band is the largest category, accounting for 41.64% of the reported distribution. The above-90% utilization group is smaller but important to investigate because high utilization can indicate limited available credit.

### 6. Outstanding Balance Statistics

| Statistical Measure | Outstanding Balance |
|---|---:|
| Mean | 32,813.54 |
| Median | 25,940.34 |
| Standard Deviation | 23,741.03 |
| Minimum | 0.00 |
| First Quartile (Q1) | 16,080.72 |
| Third Quartile (Q3) | 43,070.54 |
| Maximum | 127,453.00 |

**Business observation:** The mean outstanding balance is higher than the median, suggesting that some accounts with relatively high balances may be pulling the average upward. The standard deviation also indicates considerable variation in account balances.

The currency unit should be confirmed from the source data before these values are presented as a specific currency.

### 7. Charge-Off Flag Analysis

| Charge-Off Flag | Record Count | Average Balance | Median Balance |
|---|---:|---:|---:|
| 0 | 44,741 | 32,776.34 | 25,920.00 |
| 1 | 3,259 | 33,324.31 | 26,272.87 |

**Business observation:** The flagged records have a somewhat higher average and median outstanding balance than the unflagged records. However, the difference alone does not establish that higher balances cause charge-offs or that the flag represents a confirmed loss.

The flag's business definition, timing, and relationship to delinquency should be validated before drawing risk conclusions.

## 💳 Card Product Analysis

| Card Product | Interest Rate | Annual Fee |
|---|---:|---:|
| Business Card | 30% | 1,499 |
| Classic | 32% | 499 |
| Gold | 34% | 999 |
| Platinum | 36% | 1,999 |
| Student | 28% | 299 |

Each card product represents 20% of the reported product distribution.

### Rewards Distribution

| Rewards Type | Share |
|---|---:|
| Cashback | 40% |
| Reward Points | 20% |
| Travel | 20% |
| Air Miles | 20% |

**Business observation:** Cashback is the most common rewards category in the reported distribution. Product-level comparisons of utilization, balances, payment behaviour, and delinquency could help reveal how portfolio patterns differ across card offerings.

## 🔍 Analytical Workflow

### SQL Server

- Explored customer, product, and account snapshot data.
- Reviewed portfolio size and category distributions.
- Calculated summary metrics and aggregations.
- Examined outstanding balances, utilization, payment behaviour, and risk indicators.
- Prepared query-based findings for further analysis.

### Python

- Loaded and inspected the datasets using Pandas.
- Performed exploratory data analysis and descriptive statistics.
- Examined distributions across customer, product, and account attributes.
- Analysed outstanding balances and portfolio risk indicators.
- Used visualizations to make patterns and differences easier to interpret.

## 💡 Business Takeaways

1. **Monitor high utilization:** Review accounts in the above-90% utilization band alongside repayment behaviour and available credit.
2. **Investigate repayment shortfalls:** Examine accounts with below-minimum payments or no payments to identify potential early-warning signals.
3. **Segment portfolio exposure:** Compare outstanding balances and risk indicators across credit score, age, salary, and card product categories.
4. **Review flagged accounts carefully:** Validate charge-off and delinquency definitions before treating the indicators as confirmed credit losses.
5. **Use multiple measures together:** Customer profiles, balances, utilization, and payment history provide more context than any single metric.

These are descriptive observations, not predictions of default or evidence of causation.

## 📁 Repository Structure

```text
credit-card-portfolio-risk-analytics/
│
├── SQL/
│   └── credit_card_risk_analysis.sql
│
├── Python/
│   └── CreditRisk_Analysis.ipynb
│
└── README.md
```

## 🚀 Future Enhancements

- Develop an interactive Power BI dashboard for portfolio monitoring.
- Add KPI cards and filters for customer segments, card products, utilization, and repayment behaviour.
- Build drill-down views for delinquency indicators and outstanding balances.
- Improve risk monitoring through additional segment-level comparisons and validated business definitions.

## ⚠️ Notes & Limitations

- Results reflect the dataset and calculations used in this project.
- Record-level percentages may differ from unique-customer percentages.
- The identical reported counts for DPD above 90 days and charge-off-flagged records (3,259 each) should be investigated. Equal counts do not establish that these are the same records.
- The charge-off flag should be validated against its source definition.
- Descriptive statistics identify patterns but do not establish causation or predict future credit losses.
- Currency units and business definitions should be confirmed before using the findings in formal reporting.

## 👩‍💻 Project Focus

This project demonstrates practical application of SQL querying, Python-based exploratory data analysis, descriptive statistics, and business-oriented interpretation in a credit card portfolio analytics context.

---

<p align="center">
  <b>Credit Card Portfolio & Risk Analytics</b><br/>
  SQL Server · Python · Pandas · Exploratory Data Analysis
</p>
