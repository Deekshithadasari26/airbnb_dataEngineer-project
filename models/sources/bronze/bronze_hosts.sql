{% set incremental_flag = 1 %}
{% set incremental_col = 'CREATED_AT' %}


Select * from {{source('staging','hosts')}}

{% if incremental_flag == 1 %}
    where {{incremental_col}} > (select coalesce(max({{incremental_col}}), '1900-01-01') from {{ this }})
{% endif %}
