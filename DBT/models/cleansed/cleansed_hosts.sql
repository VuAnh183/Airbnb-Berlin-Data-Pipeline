WITH src_hosts AS(
    SELECT 
        * 
    FROM 
        {{ ref('src_hosts') }}
)
SELECT
    host_id,
    NVL(
        host_name,
        'Anonymous'
    ) AS host_name,
    CASE
        WHEN is_superhost = 't' THEN TRUE
        WHEN is_superhost = 'f' THEN FALSE
        WHEN is_superhost IS NULL THEN FALSE
    END AS is_superhost,
    created_at,
    updated_at
FROM
    src_hosts
