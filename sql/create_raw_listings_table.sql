

SET search_path TO raw;

DROP TABLE IF EXISTS raw_listings;

CREATE TABLE raw_listings (
    id INTEGER,
    listing_url TEXT,         
    name VARCHAR(255),        
    room_type VARCHAR(50),
    minimum_nights INTEGER,
    host_id INTEGER,
    price VARCHAR(20),   
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);