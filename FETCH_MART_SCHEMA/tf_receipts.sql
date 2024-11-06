SELECT
    r._id AS receipt_id
    , r.bonusPointsEarned AS receipt_bonus_points_earned
    , r.bonusPointsEarnedReason AS receipt_bonus_points_reason
    , r.createDate AS receipt_create_date
    , r.dateScanned AS receipt_date_scanned
    , r.finishedDate AS receipt_finished_date
    , r.modifyDate AS receipt_modify_date
    , r.pointsAwardedDate AS receipt_points_awarded_date
    , r.pointsEarned AS receipt_points_earned
    , r.purchaseDate AS receipt_purchase_date
    , r.purchasedItemCount AS receipt_item_count
    , r.rewardsReceiptItemList AS receipt_item_list
    , r.rewardsReceiptStatus AS receipt_status
    , r.totalSpent AS receipt_total_spent
    , r.userId AS user_id
FROM {{ source('fetch_ingest', 'receipts') }} AS r
