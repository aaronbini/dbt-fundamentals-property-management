with bank_accounts as (
    select
        id as bank_account_id,
        name,
        bank_account_number,
        routing_number
    from {{ source('property_management', 'bank_accounts') }}
)

select * from bank_accounts