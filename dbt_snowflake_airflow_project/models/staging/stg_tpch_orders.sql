select
    o.o_orderkey as o_orderkey,
    o.o_custkey as o_custkey,
    o.o_orderstatus as o_orderstatus,
    o.o_totalprice as o_totalprice,
    o.o_orderdate as o_orderdate
from {{ source('tpch', 'orders') }} o