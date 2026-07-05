

WITH raw_listings AS (
	SELECT
		*
	FROM
		airbnb.raw.raw_listings
)

SELECT
	id as listing_id,
	name as listing_name,
	room_type,
	minimum_nights,
	host_id,
	price,
	created_at,
	updated_at
FROM
	raw_listings