SELECT
    generate_surrogate_key('user_id') AS USER_KEY
    , USER_ID
    , USER_STATE
    , USER_CREATED_DATE
    , USER_LAST_LOGIN
    , USER_ROLE
    , IS_ACTIVE
FROM {{ ref('tf_users') }}
