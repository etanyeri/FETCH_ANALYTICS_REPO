
-- check missing data
SELECT COUNT(*) AS missing_data
FROM users
WHERE createdDate IS NULL OR _id IS NULL;



-- Check for duplicates in factReceipts table
SELECT 
    USER_KEY,
    , RECEIPT_PURCHASE_DATE
    , RECEIPT_TOTAL_SPENT
    COUNT(*) AS duplicate_count
FROM 
    factReceipts
GROUP BY ALL
HAVING COUNT(*) > 1;



-- check abnormalities
SELECT _id, total_spent
FROM receipts
WHERE total_spent < 0;



-- check distinct values of boolean 
SELECT DISTINCT topBrand
FROM brands;


-- Check for state names that are not exactly 2 characters in length
SELECT 
    USER_ID
    , USER_NAME
    , USER_STATE AS invalid_state
FROM 
    dimUser
WHERE 
    LENGTH(USER_STATE) != 2
    OR USER_STATE IS NULL;




