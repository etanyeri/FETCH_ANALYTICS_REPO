WITH flattened_receipt_items AS (
    SELECT DISTINCT
        r._id
        , f.value:barcode::string AS PRODUCT_ID
        , f.value:description::string AS DESCRIPTION
        , f.value:quantityPurchased::int AS QUANTITY_PURCHASED
        , f.value:itemPrice::float AS PRICE
        , f.value:finalPrice::float AS FINAL_PRICE
        , f.value:userFlaggedBarcode::string AS USER_FLAGGED_BARCODE
        , f.value:userFlaggedNewItem::boolean AS IS_USER_FLAGGED_NEW_ITEM
        , f.value:userFlaggedPrice::float AS USER_FLAGGED_PRICE
        , f.value:userFlaggedQuantity::int AS USER_FLAGGED_QUANTITY
        , f.value:needsFetchReview::boolean AS HAS_NEEDS_FETCH_REVIEW
        , f.value:preventTargetGapPoints::boolean AS HAS_PREVENT_TARGET_GAP_POINTS
        , f.value:partnerItemId::string AS PARTNER_ITEM_ID
        , f.value:rewardsGroup::string AS REWARDS_GROUP
        , f.value:rewardsProductPartnerId::string AS REWARDS_PRODUCT_PARTNER_ID
        , f.value:competitiveProduct::boolean AS IS_COMPETITIVE_PRODUCT
    FROM 
        {{ source('fetch_ingest', 'receipts') }} AS r
        , LATERAL FLATTEN(input => r.rewardsReceiptItemList) f
)

SELECT 
    r.RECEIPT_KEY
    , r.USER_KEY
    , r.RECEIPT_ID
    , fr.PRODUCT_ID
    , fr.DESCRIPTION
    , fr.QUANTITY_PURCHASED
    , fr.PRICE
    , fr.FINAL_PRICE
    , fr.USER_FLAGGED_BARCODE
    , fr.IS_USER_FLAGGED_NEW_ITEM
    , fr.USER_FLAGGED_PRICE
    , fr.USER_FLAGGED_QUANTITY
    , fr.HAS_NEEDS_FETCH_REVIEW
    , fr.HAS_PREVENT_TARGET_GAP_POINTS
    , fr.PARTNER_ITEM_ID
    , fr.REWARDS_GROUP
    , fr.REWARDS_PRODUCT_PARTNER_ID
    , fr.IS_COMPETITIVE_PRODUCT
    
FROM {{ ref('tf_receipts') }} AS r
JOIN flattened_receipt_items fr ON r._id = fr.RECEIPT_ID;
