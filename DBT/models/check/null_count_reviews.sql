WITH src_reviews AS (
    SELECT
        *
    FROM   
        {{  ref('src_reviews')  }}
) 
-- After doing another query to list out all the rows with sentiment but without review, you will notice a patern
-- All rows with no review will always have the value "negative" in sentiment
SELECT
    (
    SELECT
        COUNT(*)
    FROM 
        src_reviews
    WHERE 
        REVIEW_TEXT IS NULL OR 
        REVIEW_SENTIMENT IS NULL       
) AS EXIST_NULL_VALUE,
    (
    SELECT
        COUNT(*)
    FROM 
        src_reviews
    WHERE 
        REVIEW_TEXT IS NULL AND REVIEW_SENTIMENT IS NOT NULL
) AS REVIEW_NULL_VALUE_ONLY, 
    (
    SELECT
        COUNT(*)
    FROM 
        src_reviews
    WHERE 
        REVIEW_SENTIMENT IS NULL AND REVIEW_TEXT IS NOT NULL
) AS SENTIMENT_NULL_VALUE_ONLY,    
    (
    SELECT
        COUNT(*)
    FROM 
        src_reviews
    WHERE 
        REVIEW_TEXT IS NULL AND
        REVIEW_SENTIMENT IS NULL
) AS BOTH_NULL_VALUE
