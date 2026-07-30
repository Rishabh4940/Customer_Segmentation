# 📊 Customer Segmentation Using RFM Analysis

End-to-end segmentation of **4,372 customers** using **Python, SQL, and Power BI** — 
built in pandas, then reproduced and validated in SQL.

---

## 🎯 Business Problem
Most businesses can't clearly see who their most valuable customers are, who is 
drifting away, and how revenue concentrates across customer groups. This project 
segments customers into 6 actionable groups using **RFM (Recency, Frequency, Monetary)** 
analysis, turning raw transaction data into targeted retention strategy.

---

## 📈 Key Findings
- **Champions are 22% of customers but drive 66.6% of revenue** — revenue is heavily 
  concentrated, making retention of this segment the single biggest lever.
- **Lost + Others make up ~49% of the base but only ~13% of revenue** — a large low-value tail.
- **Loyal Customers (15% of base) contribute a steady 15% of revenue** — the predictable core.
- **At-Risk customers still hold recoverable revenue** — the most time-sensitive intervention.

---

## 🧩 Customer Segments

| Segment | Customers | % of Base | % of Revenue |
|---|---|---|---|
| Champions | 946 | 21.6% | 66.6% |
| Loyal Customers | 679 | 15.5% | 15.0% |
| Others | 1,070 | 24.5% | 8.5% |
| Lost Customers | 1,070 | 24.5% | 4.8% |
| New Customers | 362 | 8.3% | 2.3% |
| At Risk | 245 | 5.6% | 2.9% |

---

## 🔢 Approach
1. **Cleaning** — removed transactions with missing CustomerID; computed `TotalPrice = Quantity × UnitPrice`
2. **RFM metrics** — Recency (days since last purchase), Frequency (transaction count), Monetary (total spend) per customer
3. **Scoring** — each metric scored 1–5 using quantile binning (pandas `qcut` / SQL `NTILE`)
4. **Segmentation** — rule-based mapping of R/F/M scores into 6 business segments

---

## 🔁 SQL Validation
The full RFM pipeline was rebuilt in SQL — CTEs for the R/F/M calculation, `NTILE(5)` 
for scoring, and a `CASE` statement for segment assignment — then validated against the 
pandas implementation. **Segment counts matched within ~1%**, with small differences at 
score boundaries due to how `qcut` and `NTILE` break ties.

See [`rfm_segmentation.sql`](rfm_segmentation.sql).

---

## 📊 Power BI Dashboard
Interactive dashboard showing customer distribution by segment, revenue contribution 
per segment, and key KPIs (Total Customers, Total Revenue, Avg Revenue per Customer).

![Dashboard](dashboard_main.jpg)

---

## 🛠️ Tech Stack
**Python** (Pandas, NumPy, Matplotlib, Seaborn) · **SQL** (CTEs, Window Functions) · 
**Power BI** · **Jupyter Notebook**

---

## 📂 Repository Files
- `customerSegmentation.ipynb` — full pandas analysis (cleaning → RFM → segmentation → EDA)
- `rfm_segmentation.sql` — SQL reproduction and validation of the pipeline
- `customerSegmentation.pbix` — Power BI dashboard
- `dashboard.jpg` — dashboard preview

---

## 📌 Data
UCI **Online Retail** dataset — UK e-commerce transactions (Dec 2010 – Dec 2011), 
available on Kaggle.
