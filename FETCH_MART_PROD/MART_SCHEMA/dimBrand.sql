SELECT
    generate_surrogate_key(b.brand_id) AS BRAND_KEY
    , b.BRAND_ID
    , b.BRAND_BARCODE
    , b.BRAND_CODE
    , b.BRAND_CATEGORY
    , b.BRAND_CATEGORY_CODE
    , b.BRAND_CPG
    , b.IS_BRAND_TOP
    , b.BRAND_NAME
FROM {{ ref('tf_brands') }} AS b
