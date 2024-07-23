{{ config(store_failures =false ) }}

select * from {{ ref('stg_payments') }}
where amount > 3000