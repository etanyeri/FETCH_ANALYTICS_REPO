
SELECT
  generate_surrogate_key(RECEIPT_ID || '-' || PRODUCT_ID) AS RECEIPT_ITEM_KEY
  , ri.RECEIPT_KEY
  , ri.RECEIPT_ID
  , ri.TOTAL_SPENT
  , ri.POINTS_EARNED
  , ri.RECEIPT_STATUS
  , ri.PRODUCT_ID
  , ri.QUANTITY_PURCHASED
  , ri.PRICE
  , ri.FINAL_PRICE
FROM {{ ref('tf_receiptitems') }} AS ri
