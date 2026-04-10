{{
  config(
    materialized = 'incremental',
    unique_key = 'listing_id'
    )
}}

select 
        Listing_ID,
        HOST_ID,
        Property_Type,
        ROOM_TYPE,
        CITY,
        COUNTRY,
        ACCOMMODATES,
        BEDROOMS,
        BATHROOMS,
        PRICE_PER_NIGHT,
        {{ tag('price_per_night')}} As price_per_night_tag,
        CREATED_AT
from 
    {{ref('bronze_listings')}}