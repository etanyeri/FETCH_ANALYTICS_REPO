SELECT
    b._id AS brand_id
    , b.barcode AS brand_barcode
    , b.brandCode AS brand_code
    , b.category AS brand_category
    , b.categoryCode AS brand_category_code
    , b.cpg AS brand_cpg
    , b.topBrand AS brand_top
    , b.name AS brand_name
FROM {{ source('fetch_ingest', 'brands') }} AS b
