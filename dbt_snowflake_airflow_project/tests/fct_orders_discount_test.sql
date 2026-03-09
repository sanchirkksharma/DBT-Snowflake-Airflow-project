select 
    *
from
    {{ ref('fct_orders') }}
where 
    total_item_discount_amount > 0