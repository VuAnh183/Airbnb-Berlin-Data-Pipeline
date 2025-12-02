WITH src_hosts AS(
    SELECT
        *
    FROM 
        {{ ref('src_hosts') }}
)

SELECT
    SUM(CASE 
            WHEN 
                HOST_ID IS NULL 
            THEN 1 ELSE 0 
        END) AS HOST_ID_NULLS,
    SUM(CASE 
            WHEN 
                HOST_NAME IS NULL 
            THEN 1 ELSE 0 
        END) AS HOST_NAME_NULLS,
    SUM(CASE 
            WHEN 
                IS_SUPERHOST IS NULL 
            THEN 1 ELSE 0 
        END) AS IS_SUPERHOST_NULLS,
    SUM(CASE 
            WHEN 
                CREATED_AT IS NULL 
            THEN 1 ELSE 0 
        END) AS CREATED_AT_NULLS,
    SUM(CASE 
            WHEN 
                UPDATED_AT IS NULL 
            THEN 1 ELSE 0 
        END) AS UPDATED_AT_NULLS
FROM
    src_hosts