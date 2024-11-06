SELECT
    b._idAS _id
    , NULLIF(b.barcode, '') AS barcode
    , NULLIF(b.brandCode, '') AS brandCode
    , NULLIF(b.category, '') AS category
    , NULLIF(b.categoryCode, '') AS categoryCode
    , NULLIF(b.cpg, '') AS cpg
    , NULLIF(b.topBrand, '') AS topBrand
    , NULLIF(b.name, '') AS name
FROM {{ source('fetch_raw', 'brands') }} AS b
