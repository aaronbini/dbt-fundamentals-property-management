with transactions as (
    select transaction_id, created_at, amount from {{ ref('stg_transactions') }}
),

stripe_payments as (
    select payment_id as id, created_at, amount from {{ ref('stg_payments') }}
),

unioned as (
    select * from stripe_payments 
    union all
    select * from transactions
),

final as (
    select * from unioned
)

select * from final