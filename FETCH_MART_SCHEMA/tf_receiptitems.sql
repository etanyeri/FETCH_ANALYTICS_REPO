WITH flattened_receipt_items AS (
    SELECT
        r.RECEIPT_KEY,
        f.value:barcode::string AS PRODUCT_ID,
        f.value:quantityPurchased::int AS QUANTITY_PURCHASED,
        f.value:itemPrice::float AS PRICE,
        f.value:finalPrice::float AS FINAL_PRICE
    FROM 
        FROM {{ source('fetch_ingest', 'receipts') }} AS r
        LATERAL FLATTEN(input => r.rewardsReceiptItemList) f
)

SELECT 
    generate_surrogate_key(r.RECEIPT_KEY || '-' || fr.PRODUCT_ID) AS RECEIPT_ITEM_KEY -- Combine receipt and product to generate a unique key
    , r.RECEIPT_KEY,
    , r.USER_KEY,
    , r.RECEIPT_ID,
    , r.TOTAL_SPENT,
    , r.POINTS_EARNED,
    , r.RECEIPT_STATUS,
    , fr.PRODUCT_ID,
    , fr.QUANTITY_PURCHASED,
    , fr.PRICE,
    , fr.FINAL_PRICE,
    
FROM 
    FROM {{ source('fetch_ingest', 'receipts') }} AS r
JOIN 
    flattened_receipt_items fr ON r.RECEIPT_KEY = fr.RECEIPT_KEY;
