SELECT
    , u._id AS user_id
    , u.state AS user_state
    , u.createdDate AS user_created_date
    , u.lastLogin AS user_last_login
    , u.role AS user_role
    , u.active AS user_active
    , u.isPremium AS user_is_premium
FROM {{ source('fetch_ingest', 'users') }} AS u
