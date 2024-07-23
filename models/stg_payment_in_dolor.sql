 select
        id,
        orderid,
        paymentmethod,
        status,
        amount,
        {{marco_cents_dollor('amount')}} as dolloramount,
        created,
        _batched_at

    from {{ source('stripe', 'payment') }}