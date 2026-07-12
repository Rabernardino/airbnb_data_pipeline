

SELECT
	t1.listing_id,
	t1.review_date,
	t2.*
FROM
	{{ ref('fct_reviews') }} t1

LEFT JOIN
	{{ ref('dim_listings_cleansed') }} t2
ON
 t1.listing_id = t2.listing_id

WHERE
	t1.review_date < t2.created_at

LIMIT 10

