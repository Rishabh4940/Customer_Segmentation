# 📊 Customer Segmentation using Advanced RFM Analysis

## 🚀 Project Overview
This project focuses on segmenting customers based on their purchasing behavior using Advanced RFM (Recency, Frequency, Monetary) Analysis. 

The goal is to help businesses identify high-value customers, detect churn risks, and design targeted marketing strategies.

The analysis is performed using Python (Pandas), and insights are visualized through an interactive Power BI dashboard.

## 🎯 Business Problem
Businesses often struggle to understand customer behavior and allocate marketing resources effectively.

Without proper segmentation:
- High-value customers may be ignored
- At-risk customers may churn unnoticed
- Marketing campaigns become inefficient

This project solves this by segmenting customers into actionable groups.

## 📂 Dataset
- Source: Kaggle
- Type: E-commerce transactional data

### Features:
- InvoiceNo: Transaction ID
- CustomerID: Unique customer identifier
- InvoiceDate: Date of purchase
- Quantity: Number of items purchased
- UnitPrice: Price per item

  ## 🧹 Data Cleaning & Preprocessing
- Removed missing Customer IDs
- Removed duplicate records
- Filtered cancelled transactions
- Handled negative quantities (returns)
- Converted InvoiceDate to datetime format
- Created TotalPrice column (Quantity × UnitPrice)

- ## 📊 Exploratory Data Analysis
Performed exploratory analysis to understand:
- Revenue trends over time
- Customer purchase patterns
- Distribution of transactions

These insights helped in building meaningful customer segments.

## 🧠 RFM Feature Engineering
Created RFM metrics for each customer:

- Recency: Days since last purchase
- Frequency: Number of transactions
- Monetary: Total spending

Customers were grouped using CustomerID to compute these values.

## 🔢 RFM Scoring
Assigned scores to each RFM metric using quantiles:
- Higher Frequency & Monetary → Higher score
- Lower Recency → Higher score

These scores were combined to evaluate overall customer value.

## 🧩 Customer Segmentation
Customers were segmented into meaningful groups using advanced logic:

- Champions – High value, frequent buyers
- Loyal Customers – Regular customers
- At Risk – Previously active but now inactive
- Lost Customers – No recent activity

This segmentation enables targeted marketing strategies.

## 📈 Key Insights

- Champions contribute the highest revenue and should be rewarded
- At-risk customers show declining activity and need retention campaigns
- Lost customers can be targeted with re-engagement offers
- Loyal customers provide stable revenue and should be nurtured

  ## 📊 Power BI Dashboard

An interactive dashboard was created to visualize:
- Customer segment distribution
- Revenue by segment
- Key KPIs (Total Revenue, Customers, Avg Spend)

## 🛠️ Tech Stack
- Python (Pandas, NumPy)
- Power BI
- Kaggle Dataset

## 🚀 Project Workflow
1. Data Collection
2. Data Cleaning
3. Feature Engineering (RFM)
4. Customer Segmentation
5. Visualization (Power BI Dashboard)    
