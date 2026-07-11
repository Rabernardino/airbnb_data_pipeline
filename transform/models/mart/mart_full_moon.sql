{{ config(
    materialized='table')
}}


WITH fct_reviews AS (
    SELECT
        *
    FROM
        {{ ref('fct_reviews') }}
),

full_moon_dates AS (
    SELECT
        *
    FROM
        {{ ref('seed_full_moon_dates') }}
)


SELECT
    review.*,
    CASE
        WHEN fm.full_moon_date IS NULL THEN 'not full moon'
        ELSE 'full moon'
    END AS is_full_moon
FROM
    fct_reviews as review
LEFT JOIN
    full_moon_dates as fm

ON (CAST(review.review_date as DATE) = (fm.full_moon_date + INTERVAL '1 day'))
