with transactions as (
    select
        id as transaction_id,
        type,
        amount,
        payer,
        payee
    from {{ source('property_management', 'transactions') }}
)

select * from transactions