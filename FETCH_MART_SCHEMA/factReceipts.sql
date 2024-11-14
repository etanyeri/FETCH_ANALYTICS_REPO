SELECT
    generate_surrogate_key(r.receipt_id) AS RECEIPT_KEY
     , du.USER_KEY
     , r.RECEIPT_ID 
     , r.RECEIPT_BONUS_POINTS_EARNED 
     , r.RECEIPT_BONUS_POINTS_REASON 
     , r.RECEIPT_CREATE_DATE
     , r.RECEIPT_DATE_SCANNED 
     , r.RECEIPT_FINISHED_DATE 
     , r.RECEIPT_MODIFY_DATE 
     , r.RECEIPT_POINTS_AWARDED_DATE 
     , r.RECEIPT_POINTS_EARNED 
     , r.RECEIPT_PURCHASE_DATE
     , r.RECEIPT_STATUS 
     , r.RECEIPT_TOTAL_SPENT 
     , r.RECEIPT_POINTS_PER_DOLLAR_SPENT 
FROM {{ ref('tf_receipts') }} AS r
LEFT JOIN {{ ref('dimUsers') }} AS du ON r.user_id = u.user_id
