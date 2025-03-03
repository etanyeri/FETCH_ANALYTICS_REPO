SELECT
    generate_surrogate_key(ri.RECEIPT_ID || '-' || ri.PRODUCT_ID) AS RECEIPT_ITEM_KEY
    , ri.RECEIPT_KEY
    , ri.USER_KEY
    , db.BRAND_KEY
    , ri.RECEIPT_ID
    , ri.PRODUCT_ID
    , ri.DESCRIPTION
    , ri.QUANTITY_PURCHASED
    , ri.PRICE
    , ri.FINAL_PRICE
    , ri.USER_FLAGGED_BARCODE
    , ri.IS_USER_FLAGGED_NEW_ITEM
    , ri.USER_FLAGGED_PRICE
    , ri.USER_FLAGGED_QUANTITY
    , ri.HAS_NEEDS_FETCH_REVIEW
    , ri.PREVENT_TARGET_GAP_POINTS
    , ri.PARTNER_ITEM_ID
    , ri.REWARDS_GROUP
    , ri.REWARDS_PRODUCT_PARTNER_ID
    , ri.IS_COMPETITIVE_PRODUCT  
FROM {{ ref('tf_receiptitems') }} AS ri
LEFT JOIN {{ ref('dimBrand') }} AS db ON ri.PRODUCT_ID = db.BRAND_BARCODE
