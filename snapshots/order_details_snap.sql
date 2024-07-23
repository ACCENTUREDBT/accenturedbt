{% snapshot order_details_snap %}
    {{
        config(
            target_schema='snapshot_db',
            unique_key='order_id',
            strategy='timestamp',
            invalidate_hard_deletes=true,
            updated_at='STATUS_CHANGED_AT'
            
        )
    }}

    select * from {{ source('stripe', 'order_status') }}
{% endsnapshot %}
