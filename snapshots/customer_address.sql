{% snapshot snap_customer_address %}
    {{
        config(
            target_schema='snapshot_db',
            unique_key='customer_id',
            strategy='timestamp',
            invalidate_hard_deletes=false,
            updated_at='UPDATED_AT'
            
        )
    }}

    select * from {{ source('stripe', 'customer_address') }}
{% endsnapshot %}
