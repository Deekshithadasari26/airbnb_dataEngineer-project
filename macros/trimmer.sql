{% macro trimmer(column_NAME,NODE) %}
    {{ col_name|trim()|upper()}}
{% endmacro %}