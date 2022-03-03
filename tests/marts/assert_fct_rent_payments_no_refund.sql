with payments as (
    select * from {{ ref('fct_rent_payments') }}
),

unit_totals as (
    select
        unit_id,
        sum(case when type='charge' then amount else 0 end) as unit_charges,
        sum(case when type='credit' then amount else 0 end) as unit_credits
    from payments
    group by unit_id
)

select * from unit_totals
    where unit_credits > unit_charges
