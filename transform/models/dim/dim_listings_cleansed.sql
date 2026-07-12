{{
    config(
        materialized='view'
    )
}}

WITH src_listings AS (
    SELECT 
        * 
    FROM 
        {{ ref('src_listings') }}
)

SELECT
    listing_id,
    listing_name,
    room_type,
    CASE
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,
    host_id,
    CAST(REPLACE(price, '$', '') as NUMERIC) as price,
    CAST(created_at as TIMESTAMP),
    CAST(updated_at as TIMESTAMP)
FROM
    src_listings