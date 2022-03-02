with tenants as (
    select * from {{ ref('dim_tenants') }}
),

leases as (
    select * from {{ ref('stg_leases') }}
),

units as (
    select * from {{ ref('stg_units') }}
),

transactions as (
    select * from {{ ref('stg_transactions') }}
),

tenant_unit_leases as (
    select
        ten.tenant_name,
        l.unit_id,
        u.rent
    from leases as l
    join tenants as ten using (lease_id)
    join units as u using (unit_id)
),

final as (
    select
        tr.transaction_id,
        tr.amount,
        tr.payer,
        tr.payee,
        tr.created_at,
        tul.tenant_name
    from transactions as tr
    join tenant_unit_leases as tul on tr.payer = tul.tenant_name
    where tr.type = 'charge'
    and tr.amount = tul.rent
)

select * from final