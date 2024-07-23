with ana_customer as
(
 select *  from    {{ ref('stg_customers') }}
),
ana_orders as
(
    select * from {{ ref('stg_orders') }}
),
ana_payments as 
(
    select * from {{ ref('stg_payments') }}
),
ana_customer_order as 
(
   select
        customer_id,
        order_id as order_id,
         min(order_date) as min_ana_customer_order,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from ana_orders 
   group by 1,2
),
ana_order_payment  as
(
    select 
   ORDERID as order_id,
 
   min(amount) as min_order_amount,
   max(amount) as maximum_amount
 
  
    from ana_payments
  group by 1
),

final as
(
    select ana_customer.customer_id,
    ana_customer.FIRST_NAME,
    ana_customer.last_name,
    ana_customer_order.order_id,
    ana_customer_order.min_ana_customer_order,
    ana_customer_order.most_recent_order_date,
    ana_customer_order.number_of_orders,
  
    ana_order_payment.min_order_amount,
    ana_order_payment.maximum_amount
   

    from ana_customer 
    join 
    ana_customer_order
     on ana_customer.customer_id=ana_customer_order.customer_id 
    join ana_order_payment 
    on ana_customer_order.order_id=ana_order_payment.order_id
    
)
select * from final

