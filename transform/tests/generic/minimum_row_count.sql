

{% test minimum_row_count(model, row_count) %}
{{ config(severity = 'warn') }}

SELECT
    COUNT(*) as ctn
FROM
    {{ model }}
HAVING
    COUNT(*) < {{ row_count }}

{% endtest %}