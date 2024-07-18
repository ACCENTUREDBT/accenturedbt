with customers_ref as
(
    select * from {{ ref('stg_customers1') }}
),

orders_ref as
(
    select * from {{ ref('stg_orders') }}
),

customer_orders_ref as
(
select customer_id,
min(order_date) as first_order_dt,
max(order_date) as last_order_dt,
count(order_id) as no_of_order
from orders_ref
group by  1
),

final as 
(

select 
customers_ref.customer_id as customer_id,
customers_ref.first_name,
customers_ref.last_name,
customer_orders_ref.first_order_dt,
customer_orders_ref.last_order_dt,
coalesce(customer_orders_ref.no_of_order,0) as no_of_order_of_customer
from  
customers_ref 
left join  customer_orders_ref using(customer_id)
)

select * from final