

SET search_path TO raw;

DROP TABLE IF EXISTS raw_reviews;

CREATE TABLE raw_reviews (
	listing_id INTEGER,
    date TIMESTAMP,
    reviewer_name VARCHAR(255),
    comments TEXT,                  
    sentiment VARCHAR(50)
)
