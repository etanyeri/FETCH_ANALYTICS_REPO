SELECT
    generate_surrogate_key('user_id') AS USER_KEY
    , user_id AS USER_ID
    , user_state AS USER_STATE
    , created_date AS USER_CREATED_DATE
    , user_last_login AS USER_LAST_LOGIN
    , user_role AS USER_ROLE
    , active AS IS_ACTIVE
FROM {{ ref('tf_users') }}
