1.  What are the top 5 brands by receipts scanned for most recent month?

  -- filter the most recent month and aggregate receipts by brand
WITH RecentReceipts AS (
    SELECT 
        fr.RECEIPT_ID 
        , fr.RECEIPT_DATE_SCANNED 
        , fri.BRAND_KEY
        , COUNT(r.RECEIPT_ID) AS receipts_count
    FROM factReceipts fr
    JOIN factReceiptItems fri ON fr.RECEIPT_KEY = fri.RECEIPT_KEY
    WHERE fr.RECEIPT_DATE_SCANNED >= DATE_TRUNC('MONTH', CURRENT_DATE) 
    GROUP BY ALL
)
  -- Select top 5 brands by total receipts scanned from the most recent month
SELECT 
    db.BRAND_NAME
    , SUM(rr.receipts_count) AS total_receipts_scanned
FROM RecentReceipts rr
LEFT JOIN dimBrand db ON rr.BRAND_KEY = db.BRAND_KEY
GROUP BY db.BRAND_NAME
ORDER BY total_receipts_scanned DESC
LIMIT 5;



2. Which brand has the most spend among users who were created within the past 6 months?

  -- filter users created in the last 6 months
WITH RecentUsers AS (
    SELECT 
        du.USER_KEY
    FROM dimUser du
    WHERE du.USER_CREATED_DATE >= CURRENT_DATE - INTERVAL '6 months'
)
  
  -- calculate the total amount spent by recent users per brand
SELECT 
    db.BRAND_NAME 
    , SUM(fr.RECEIPT_TOTAL_SPENT) AS total_spent
FROM factReceipts fr
LEFT JOIN factReceiptItems fri ON fr.RECEIPT_KEY = fri.RECEIPT_KEY
LEFT JOIN dimBrand db ON fri.BRAND_KEY = db.BRAND_KEY
LEFT JOIN RecentUsers ru ON fr.USER_KEY = ru.USER_KEY
GROUP BY db.BRAND_NAME
ORDER BY total_spent DESC
LIMIT 1;


3. When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?'

WITH AcceptedRejectedItems AS (
    SELECT 
        fri.QUANTITY_PURCHASED
        , fr.RECEIPT_STATUS
    FROM factReceiptItems fri
    JOIN factReceipts fr ON fri.RECEIPT_KEY = fr.RECEIPT_KEY
    WHERE fr.RECEIPT_STATUS IN ('Accepted', 'Rejected')
)
  
SELECT 
    CASE
        WHEN SUM(CASE WHEN fr.RECEIPT_STATUS = 'Accepted' THEN fri.QUANTITY_PURCHASED END) >
             SUM(CASE WHEN fr.RECEIPT_STATUS = 'Rejected' THEN fri.QUANTITY_PURCHASED END)
        THEN 'Accepted'
        ELSE 'Rejected'
    END AS greater_status
    , MAX(SUM(CASE WHEN fr.RECEIPT_STATUS = 'Accepted' THEN i.QUANTITY_PURCHASED END)) AS total_accepted_items
    , MAX(SUM(CASE WHEN fr.RECEIPT_STATUS = 'Rejected' THEN i.QUANTITY_PURCHASED END)) AS total_rejected_items
FROM AcceptedRejectedItems i
LEFT JOIN factReceipts fr ON i.RECEIPT_KEY = fr.RECEIPT_KEY;
