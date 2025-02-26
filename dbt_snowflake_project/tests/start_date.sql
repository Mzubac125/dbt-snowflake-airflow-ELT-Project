select subscription_id from {{ ref('dimcustomer') }}
where start_date < '2012-01-01'