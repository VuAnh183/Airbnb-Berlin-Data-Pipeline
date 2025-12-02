WITH src_listings AS(
    SELECT
        *
    FROM 
        {{  ref('src_listings') }}
)


SELECT
    SUM(CASE 
            WHEN 
                LISTING_ID IS NULL 
            THEN 1 ELSE 0 
        END) AS LISTING_ID_NULLS,
    SUM(CASE 
            WHEN 
                LISTING_NAME IS NULL 
            THEN 1 ELSE 0 
        END) AS LISTING_NAME_NULLS,
    SUM(CASE 
            WHEN 
                LISTING_URL IS NULL 
            THEN 1 ELSE 0 
        END) AS LISTING_URL_NULLS,
    SUM(CASE 
            WHEN 
                ROOM_TYPE IS NULL 
            THEN 1 ELSE 0 
        END) AS ROOM_TYPE_NULLS,
    SUM(CASE 
            WHEN 
                MINIMUM_NIGHTS IS NULL 
            THEN 1 ELSE 0 
        END) AS MINIMUM_NIGHTS_NULLS,
    SUM(CASE 
            WHEN 
                HOST_ID IS NULL 
            THEN 1 ELSE 0 
        END) AS HOST_ID_NULLS,
    SUM(CASE 
            WHEN 
                PRICE_STR IS NULL 
            THEN 1 ELSE 0 
        END) AS PRICE_STR_NULLS,
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
    src_listings