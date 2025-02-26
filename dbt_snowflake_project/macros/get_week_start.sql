{% macro get_week_start(week_string) %}
    DATEADD(
        DAY, 
        1,  -- ISO weeks start on Monday
        DATEADD(
            WEEK,
            CAST(
                CASE 
                    WHEN LEN(started_week) = 7 
                    THEN SUBSTRING(started_week, 7, 1)  -- Format: YYYY-W5
                    ELSE SUBSTRING(started_week, 7, 2) -- Format: YYYY-W50
                END 
                AS INT
            ) - 1,
            DATEFROMPARTS(CAST(SUBSTRING(started_week, 1, 4) AS INT), 1, 1)
        )
    )
{% endmacro %}
