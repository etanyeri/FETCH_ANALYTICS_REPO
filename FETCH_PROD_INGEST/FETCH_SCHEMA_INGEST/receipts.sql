SELECT
    r._id AS _id
    , NULLIF(r.bonusPointsEarned, '') AS bonusPointsEarned
    , NULLIF(r.bonusPointsEarnedReason, '') AS bonusPointsEarnedReason
    , CONVERT_TIMEZONE('UTC', r.createDate) AS createDate
    , CONVERT_TIMEZONE('UTC', r.dateScanned) AS dateScanned
    , CONVERT_TIMEZONE('UTC', r.finishedDate) AS finishedDate
    , CONVERT_TIMEZONE('UTC', r.modifyDate) AS modifyDate
    , CONVERT_TIMEZONE('UTC', r.pointsAwardedDate) AS pointsAwardedDate
    , NULLIF(r.pointsEarned, '') AS pointsEarned
    , CONVERT_TIMEZONE('UTC', r.purchaseDate) AS purchaseDate
    , NULLIF(r.purchasedItemCount, '') AS purchasedItemCount
    , NULLIF(r.rewardsReceiptItemList, '') AS rewardsReceiptItemList
    , NULLIF(r.rewardsReceiptStatus, '') AS rewardsReceiptStatus
    , NULLIF(r.totalSpent, '') AS totalSpent
    , NULLIF(r.userId, '') AS userId
FROM {{ source('fetch_raw', 'receipts') }} AS r
