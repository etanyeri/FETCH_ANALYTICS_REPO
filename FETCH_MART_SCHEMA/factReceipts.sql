SELECT
    generate_surrogate_key(r.receipt_id) AS RECEIPT_KEY
    , r.receipt_id AS RECEIPT_ID
    , r.receipt_bonus_points_earned AS RECEIPT_BONUS_POINTS_EARNED
    , r.receipt_bonus_points_reason AS RECEIPT_BONUS_POINTS_REASON
    , r.receipt_create_date AS RECEIPT_CREATE_DATE
    , r.receipt_date_scanned AS RECEIPT_DATE_SCANNED
    , r.receipt_finished_date AS RECEIPT_FINISHED_DATE
    , r.receipt_modify_date AS RECEIPT_MODIFY_DATE
    , r.receipt_points_awarded_date AS RECEIPT_POINTS_AWARDED_DATE
    , r.receipt_points_earned AS RECEIPT_POINTS_EARNED
    , r.receipt_purchase_date AS RECEIPT_PURCHASE_DATE
    , r.receipt_item_count AS RECEIPT_ITEM_COUNT
    , r.receipt_item_list AS RECEIPT_ITEM_LIST
    , r.receipt_status AS RECEIPT_STATUS
    , r.receipt_total_spent AS RECEIPT_TOTAL_SPENT
    , r.user_id AS USER_ID
FROM {{ ref('tf_receipts') }} AS r
