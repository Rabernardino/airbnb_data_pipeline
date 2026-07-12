{{
    config(
        materialized='table'
    )
}}

WITH src_hosts AS (
    SELECT 
        * 
    FROM 
        {{ ref('src_hosts') }}
)

SELECT
	host_id,
	COALESCE(host_name,'Anonymous') as host_name,
	is_superhost,
	CAST(created_at as TIMESTAMP),
	CAST(updated_at as TIMESTAMP)
FROM
    src_hosts
