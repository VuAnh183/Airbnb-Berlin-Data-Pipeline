WITH src_reviews AS(
    SELECT
        *
    FROM 
        {{  ref('src_reviews')  }}
)


SELECT
    SUM(CASE 
            WHEN 
                LISTING_ID IS NULL 
            THEN 1 ELSE 0 
        END) AS LISTING_ID_NULLS,
    SUM(CASE 
            WHEN 
                REVIEW_DATE IS NULL 
            THEN 1 ELSE 0 
        END) AS REVIEW_DATE_NULLS,
    SUM(CASE 
            WHEN 
                REVIEWER_NAME IS NULL 
            THEN 1 ELSE 0 
        END) AS REVIEWER_NAME_NULLS,
    SUM(CASE 
            WHEN 
                REVIEW_TEXT IS NULL 
            THEN 1 ELSE 0 
        END) AS REVIEW_TEXT_NULLS,
    SUM(CASE 
            WHEN 
                REVIEW_SENTIMENT IS NULL 
            THEN 1 ELSE 0 
        END) AS REVIEW_SENTIMENT_NULLS
FROM
    src_reviews