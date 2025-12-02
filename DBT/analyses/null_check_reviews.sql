WITH src_reviews AS (
    SELECT
        *
    FROM 
        {{  ref('src_reviews')  }}
)
SELECT
    (
    SELECT
        COUNT(*)
    FROM 
        src_reviews
) AS ALL_REVIEWS,
    (
    SELECT
        COUNT(*)
    FROM 
        src_reviews
    WHERE 
        REVIEW_TEXT IS NULL OR REVIEW_SENTIMENT IS NULL
) AS NULL_REVIEWS,
    (
    SELECT 
        COUNT(*)
    FROM 
        src_reviews
    WHERE 
        REVIEW_TEXT IS NOT NULL AND REVIEW_SENTIMENT IS NOT NULL
) AS NON_NULL_REVIEWS;




