{{
    config(
        materialized='incremental',
        unique_key='order_id',
        on_schema_change='sync_all_columns'
        
    )
}}

select * ,'{{ invocation_id }}' as batch_id from {{ source('stripe', 'order_status') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where STATUS_CHANGED_AT = (select max(STATUS_CHANGED_AT) from {{ this }}) 
{% endif %}
