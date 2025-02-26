select 
subscription_id,
box_id,
delivery_date,
product,
channel
from {{ ref('stg_boxes') }}