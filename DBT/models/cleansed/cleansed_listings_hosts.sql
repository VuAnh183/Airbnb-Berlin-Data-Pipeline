WITH listings_hosts AS(
    SELECT
        *
    FROM
        AIRBNB_BERLIN.DEV.LISTINGS_HOSTS
)
SELECT
    CASE
        WHEN IS_SUPERHOST = 'TRUE' THEN 1
        ELSE 0
    END AS IS_SUPERHOST,
    CASE
        WHEN ROOM_TYPE = 'Shared room' THEN 0
        WHEN ROOM_TYPE = 'Private room' THEN 1
        WHEN ROOM_TYPE = 'Entire home/apt' THEN 2
        WHEN ROOM_TYPE = 'Hotel room' THEN 3
    END AS ROOM_TYPE,
    MINIMUM_NIGHTS,
    PRICE
    
FROM
    listings_hosts