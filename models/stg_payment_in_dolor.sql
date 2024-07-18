 select
        id,
        orderid,
        paymentmethod,
        status,
        {{marco_cents_dollor('amount')}} as amount_in_dollors,
        created,
        _batched_at

    from {{ source('stripe', 'payment') }}