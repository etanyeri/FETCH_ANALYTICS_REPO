SELECT
     b._id AS BRAND_ID
    , b.barcode AS BRAND_BARCODE
    , b.brandCode AS BRAND_CODE
    , b.category AS BRAND_CATEGORY
    , b.categoryCode AS BRAND_CATEGORY_CODE
    , b.cpg AS BRAND_CPG
    , b.topBrand AS BRAND_TOP
    , b.name AS BRAND_NAME
FROM {{ source('fetch_ingest', 'brands') }} AS b;
