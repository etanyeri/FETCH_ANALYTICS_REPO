SELECT
    u._id AS _id
    , NULLIF(u.state, '') AS state
    , CONVERT_TIMEZONE('UTC', u.createdDate) AS createdDate
    , CONVERT_TIMEZONE('UTC', u.lastLogin) AS lastLogin
    , NULLIF(u.role, '') AS role
    , NULLIF(u.active, '') AS active
FROM {{ source('fetch_raw', 'users') }} AS u
