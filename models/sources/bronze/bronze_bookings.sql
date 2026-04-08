{{ config(materialized = 'incremental')}}


Select * from {{source('staging','bookings')}}

{% if is_incremental() %}
    where {{incremental_col}} > (select coalesce(max({{incremental_col}}), '1900-01-01') from {{ref('bronze_bookings')}})
{% endif %}

