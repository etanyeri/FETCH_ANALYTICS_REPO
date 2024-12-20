SELECT
    u._id AS USER_ID
    , u.state AS USER_STATE
    , u.createdDate AS CREATED_DATE
    , u.lastLogin AS USER_LAST_LOGIN
    , u.role AS USER_ROLE
    , u.active AS ACTIVE
FROM {{ source('fetch_ingest', 'users') }} AS u
