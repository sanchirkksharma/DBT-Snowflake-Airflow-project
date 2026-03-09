select
    o_orderkey,
    sum(extended_price) as gross_item_sales_amount,
    sum(item_discount_amount) as total_item_discount_amount,
from
    {{ ref('int_order_items') }}
group by
    o_orderkey