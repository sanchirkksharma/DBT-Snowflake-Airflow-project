select
    orders.*,
    order_items_summary.gross_item_sales_amount,
    order_items_summary.total_item_discount_amount
from
    {{ ref('stg_tpch_orders') }} as orders
join
    {{ ref('int_order_items_summary') }} as order_items_summary
        on orders.o_orderkey = order_items_summary.o_orderkey
order by
    orders.o_orderdate