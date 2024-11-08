
-- check missing data
SELECT COUNT(*) AS missing_data
FROM users
WHERE createdDate IS NULL OR _id IS NULL;



-- check abnormalities
SELECT _id, total_spent
FROM receipts
WHERE total_spent < 0;



-- check distinct values of boolean
SELECT DISTINCT topBrand
FROM brands;
