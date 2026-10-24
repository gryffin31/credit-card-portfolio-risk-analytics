 <div align="center">

<h1>💳 Credit Card Portfolio & Risk Analytics</h1>

<p><b>Turning credit card data into portfolio insights and risk indicators.</b></p>

<p>
  <img src="https://img.shields.io/badge/SQL%20Server-161E54?style=for-the-badge&logo=microsoftsqlserver&logoColor=white" alt="SQL Server"/>
  <img src="https://img.shields.io/badge/Python-359FA0?style=for-the-badge&logo=python&logoColor=white" alt="Python"/>
  <img src="https://img.shields.io/badge/Pandas-161E54?style=for-the-badge&logo=pandas&logoColor=white" alt="Pandas"/>
  <img src="https://img.shields.io/badge/Seaborn-F16D34?style=for-the-badge&logoColor=white" alt="Seaborn"/>
  <img src="https://img.shields.io/badge/Matplotlib-359FA0?style=for-the-badge&logoColor=white" alt="Matplotlib"/>
</p>

</div>

---

## 📌 Project Overview

Credit card portfolio performance depends on customer characteristics, repayment behaviour, credit utilization, product features, and delinquency patterns. This project examines these areas using **SQL Server and Python** to identify portfolio trends and support data-driven credit risk assessment.

The analysis combines SQL-based data exploration with Python statistical analysis and visualizations to examine customer segments, payment patterns, product characteristics, outstanding balances, and charge-off indicators.

## 📊 Portfolio at a Glance

<table>
<tr>
<td align="center" bgcolor="#161E54" width="25%">
<h2><font color="#FFFFFF">2,500</font></h2>
<font color="#FFFFFF">Customers</font>
</td>
<td align="center" bgcolor="#359FA0" width="25%">
<h2><font color="#FFFFFF">4,000</font></h2>
<font color="#FFFFFF">Accounts</font>
</td>
<td align="center" bgcolor="#161E54" width="25%">
<h2><font color="#FFFFFF">48,000</font></h2>
<font color="#FFFFFF">Account Statements</font>
</td>
<td align="center" bgcolor="#F16D34" width="25%">
<h2><font color="#FFFFFF">5</font></h2>
<font color="#FFFFFF">Card Products</font>
</td>
</tr>
</table>

| Portfolio indicator | Observed value |
|---|---:|
| Average credit utilization | 30.41% |
| Unpaid statements | 1,453 |
| Records with DPD above 90 days | 3,259 |
| Charge-off-flagged records | 3,259 |

## 🔍 Key Statistical Findings

### 1. Customer Profile

| Customer characteristic | Segment | Share |
|---|---|---:|
| Credit score | 700–800 | 28.60% |
| Credit score | 800+ | 28.52% |
| Credit score | 600–700 | 27.88% |
| Credit score | Below 600 | 15.00% |
| Age | 55+ | 24.44% |
| Age | 46–55 | 23.09% |
| Salary | High | 37.28% |
| Salary | Premium | 35.40% |

**Insight:** Customers with credit scores of 700 or above account for 57.12% of the portfolio. High- and premium-salary customers together represent 72.68% of the customer base.

### 2. Repayment Behaviour

| Payment behaviour | Share |
|---|---:|
| Above minimum due | 80.99% |
| Below minimum due | 15.39% |
| No payment | 3.63% |

**Insight:** Although 80.99% of records fall into the above-minimum-due category, the below-minimum-due and no-payment groups warrant closer monitoring for repayment stress.

The customer-segment analysis also identifies Revolvers at 80.99%, Delinquent customers at 15.39%, No Payment at 3.03%, and Transactors at 0.60%.

### 3. Credit Utilization

| Utilization range | Share |
|---|---:|
| 10–30% | 41.64% |
| 0–10% | 24.63% |
| 30–50% | 15.95% |
| 50–75% | 8.84% |
| 75–90% | 2.50% |
| Above 90% | 5.82% |
| No usage | 0.62% |

**Insight:** The 10–30% utilization band is the largest segment. Records above 50% utilization account for 17.16% across the reported utilization bands, making higher-utilization customers a useful segment for further risk analysis.

### 4. Outstanding Balance and Charge-Offs

| Outstanding balance statistic | Value |
|---|---:|
| Mean | 32,813.54 |
| Median | 25,940.34 |
| Standard deviation | 23,741.03 |
| Minimum | 0.00 |
| 25th percentile | 16,080.72 |
| 75th percentile | 43,070.54 |
| Maximum | 127,453.00 |

| Charge-off flag | Records | Average outstanding balance | Median outstanding balance |
|---|---:|---:|---:|
| 0 | 44,741 | 32,776.34 | 25,920.00 |
| 1 | 3,259 | 33,324.31 | 26,272.87 |

**Insight:** Charge-off-flagged records have a slightly higher average and median outstanding balance than records without the flag. These descriptive differences alone do not establish that outstanding balance causes charge-offs.

### 5. Card Product Analysis

| Product | Interest rate | Annual fee |
|---|---:|---:|
| Business Card | 30% | 1,499 |
| Classic Card | 32% | 499 |
| Gold Card | 34% | 999 |
| Platinum Card | 36% | 1,999 |
| Student Card | 28% | 299 |

Each card type represents 20% of the product records.

**Insight:** Platinum Card has the highest interest rate and annual fee, while Student Card has the lowest. Product pricing and rewards can be compared with customer profiles and repayment patterns to support portfolio segmentation.

## 🛠️ Tools & Technologies

- **SQL Server:** Data exploration, aggregation, segmentation, and portfolio-level analysis.
- **Python:** Statistical analysis and analytical workflows.
- **Pandas:** Data manipulation and summary statistics.
- **Matplotlib and Seaborn:** Data visualization and distribution analysis.
- **Jupyter Notebook:** Documenting Python analysis, results, and findings.

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

## 🔄 Analytical Workflow

1. **Data preparation:** Work with customer, product, and account-level datasets.
2. **SQL analysis:** Examine portfolio composition, repayment patterns, utilization, balances, and risk indicators.
3. **Python analysis:** Perform descriptive statistics, customer segmentation, comparisons, and visualizations.
4. **Insight generation:** Identify portfolio patterns and areas that may require further risk investigation.
5. **Business interpretation:** Translate analytical findings into actionable questions for credit risk monitoring.

## 💼 Business Value

The analysis provides a foundation for:

- Identifying customer segments that may need closer repayment monitoring.
- Examining utilization levels and outstanding-balance distributions.
- Comparing card products by interest rates, annual fees, and rewards.
- Exploring differences between charge-off-flagged and non-flagged records.
- Supporting data-informed portfolio monitoring and credit risk discussions.

## ⚠️ Interpretation Notes

- Percentages may differ slightly from 100% because of rounding.
- The utilization distribution shown above excludes any unclassified or missing category.
- The reported DPD-above-90 and charge-off-flagged counts are both 3,259; the underlying definitions and record-level overlap should be validated before drawing conclusions.
- The findings are descriptive. They should not be interpreted as proof of causation or as a validated credit risk prediction model.

## 🚀 Next Steps

- Develop a Power BI dashboard for interactive portfolio monitoring.
- Add KPI cards, segment comparisons, and trend analysis.
- Extend the analysis with deeper delinquency and charge-off investigations.

---

<div align="center">

### Data → Analysis → Insight

*Credit Card Portfolio & Risk Analytics*

</div>
