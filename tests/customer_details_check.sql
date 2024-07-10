{{ config(store_failures = true) }}

select  * from {{ source('jaffle_shop', 'customers') }}
where first_name='sanjeevini'