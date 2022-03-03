with transactions as (
    select
        id as transaction_id,
        type,
        amount,
        payer,
        payee,
        created_at
    from {{ source('property_management', 'transactions') }}
)

select * from transactions