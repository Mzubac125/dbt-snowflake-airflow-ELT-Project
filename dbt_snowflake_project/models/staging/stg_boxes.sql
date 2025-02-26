select *
from
    {{ source('hellofresh', 'boxes') }}
where started_week <> 'NA'