SELECT
     r._id AS RECEIPT_ID
    , r.bonusPointsEarned AS RECEIPT_BONUS_POINTS_EARNED
    , r.bonusPointsEarnedReason AS RECEIPT_BONUS_POINTS_REASON
    , r.createDate AS RECEIPT_CREATE_DATE
    , r.dateScanned AS RECEIPT_DATE_SCANNED
    , r.finishedDate AS RECEIPT_FINISHED_DATE
    , r.modifyDate AS RECEIPT_MODIFY_DATE
    , r.pointsAwardedDate AS RECEIPT_POINTS_AWARDED_DATE
    , r.pointsEarned AS RECEIPT_POINTS_EARNED
    , r.purchaseDate AS RECEIPT_PURCHASE_DATE
    , r.purchasedItemCount AS RECEIPT_ITEM_COUNT
    , r.rewardsReceiptItemList AS RECEIPT_ITEM_LIST
    , r.rewardsReceiptStatus AS RECEIPT_STATUS
    , r.totalSpent AS RECEIPT_TOTAL_SPENT
    , r.userId AS USER_ID
    
    -- Stakeholder Request: Total points earned vs total spent
    , (r.pointsEarned + r.bonusPointsEarned) / NULLIF(r.totalSpent, 0) AS RECEIPT_POINTS_PER_DOLLAR_SPENT  -- Prevent division by zero
FROM {{ source('fetch_ingest', 'receipts') }} AS r;
