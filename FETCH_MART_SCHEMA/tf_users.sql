SELECT
    , u._id AS user_id
    , u.state AS user_state
    , u.createdDate AS created_date
    , u.lastLogin AS user_last_login
    , u.role AS user_role
    , u.active AS active
FROM {{ source('fetch_ingest', 'users') }} AS u
