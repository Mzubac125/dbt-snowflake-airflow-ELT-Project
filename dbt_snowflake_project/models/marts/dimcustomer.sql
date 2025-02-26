WITH 
boxes AS (
    SELECT subscription_id,
           {{ get_week_start('started_week') }} AS start_date
    FROM {{ ref('stg_boxes') }}
),
cancels AS (
    SELECT subscription_id,
           CASE WHEN event_type is not null THEN event_type
           ELSE 'active' END AS status,
           row_number() OVER (PARTITION BY subscription_id ORDER BY event_date) AS rn
    FROM {{ ref('stg_cancels') }}
),
pauses AS (
    SELECT subscription_id,
           CASE WHEN pause_end IS NULL THEN 'Y'
                ELSE 'N' 
           END AS pausedyn
    FROM {{ ref('stg_pauses') }}
)

SELECT 
    b.subscription_id,
    b.start_date,
    c.status,
    p.pausedyn
FROM boxes b
LEFT JOIN cancels c ON b.subscription_id = c.subscription_id
LEFT JOIN pauses p ON b.subscription_id = p.subscription_id