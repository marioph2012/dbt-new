{% macro no_nulls_in_columns(model) %}
    SELECT * FROM {{ model }} WHERE
    {% for col in adapter.get_columns_in_relation(model) %}
        {{col.column }} is null {% if not loop.last %} or {% endif %}
    {% endfor %}
{% endmacro %}