SELECT
    generate_surrogate_key(b.brand_id) AS BRAND_KEY
    , b.brand_id AS BRAND_ID
    , b.brand_barcode AS BRAND_BARCODE
    , b.brand_code AS BRAND_CODE
    , b.brand_category AS BRAND_CATEGORY
    , b.brand_category_code AS BRAND_CATEGORY_CODE
    , b.brand_cpg AS BRAND_CPG
    , b.brand_top AS BRAND_TOP
    , b.brand_name AS BRAND_NAME
FROM {{ ref('tf_dimbrands') }} AS b
