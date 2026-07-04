

SET search_path TO raw;

DROP TABLE IF EXISTS raw_hosts;

CREATE TABLE raw_hosts (
	id INTEGER,
    name VARCHAR(255),
    is_superhost VARCHAR(10),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
)

