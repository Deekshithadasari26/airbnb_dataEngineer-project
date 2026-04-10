{{
  config(
    materialized = 'incremental',
    unique_key = 'host_id'
    )
}}

SELECT
    HOST_ID,
    REPLACE(HOST_NAME,' ','_') as HOST_NAME,
    HOST_SINCE AS HOST_SINCE,
    IS_SUPERHOST AS IS_SUPERHOST,
    RESPONSE_RATE AS RESPONSE_RATE,
    CASE
    WHEN RESPONSE_RATE > 95 THEN 'VERY_GOOD'
    WHEN RESPONSE_RATE > 80 THEN 'GOOD'
    WHEN RESPONSE_RATE > 60 THEN 'FAIR'
    ELSE 'POOR'
    END AS RESPONSE_RATE_QUALITY,
from 
    {{ref('bronze_hosts')}}
QUALIFY ROW_NUMBER() OVER (PARTITION BY HOST_ID ORDER BY CREATED_AT DESC) = 1
