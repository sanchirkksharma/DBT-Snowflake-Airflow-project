select 
    line_item.order_item_key,
    orders.o_orderkey,
    line_item.part_key,
    line_item.extended_price,
    line_item.line_number,
    orders.o_custkey,
    orders.o_orderdate,
    {{ discounted_amount('line_item.extended_price', 'line_item.discount_percentage') }} as item_discount_amount
from
    {{ ref('stg_tpch_orders') }} as orders
join
    {{ ref('stg_tpch_line_items') }} as line_item
        on orders.o_orderkey = line_item.order_key
order by
    orders.o_orderdate
