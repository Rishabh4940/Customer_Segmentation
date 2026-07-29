WITH cleaned AS (
    SELECT
        CustomerID,
        InvoiceNo,
        UnitPrice * Quantity AS total_price,
        invoice_dt
    FROM online_retail
    WHERE CustomerID IS NOT NULL AND CustomerID != ''
),
rfm AS (
    SELECT
        CustomerID,
        CAST(julianday((SELECT date(MAX(invoice_dt), '+1 day') FROM cleaned))
             - julianday(MAX(invoice_dt)) AS INT) AS recency,
        COUNT(*) AS frequency,
        SUM(total_price) AS monetary
    FROM cleaned
    GROUP BY CustomerID
),
scored AS (
    SELECT
        CustomerID, recency, frequency, monetary,
        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
    FROM rfm
),
segmented AS (
    SELECT *,
        CASE
            WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
            WHEN f_score >= 4 AND m_score >= 3 THEN 'Loyal Customers'
            WHEN r_score >= 4 AND f_score <= 2 THEN 'New Customers'
            WHEN r_score <= 2 AND f_score >= 3 AND m_score >= 3 THEN 'At Risk'
            WHEN r_score <= 2 AND f_score <= 2 THEN 'Lost Customers'
            ELSE 'Others'
        END AS segment
    FROM scored
)
SELECT segment, COUNT(*) AS customers
FROM segmented
GROUP BY segment
ORDER BY customers DESC;
