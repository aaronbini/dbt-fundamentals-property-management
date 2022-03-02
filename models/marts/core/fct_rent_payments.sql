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

tenant_leases as (
    select
        ten.tenant_name,
        l.unit_id
    from tenants as ten
    join leases as l using (lease_id)
),

tenant_unit_leases as (
    select
        u.rent,
        tl.*
    from units as u
    join tenant_leases as tl using (unit_id)
),

final as (
    select
        t.transaction_id,
        t.amount,
        t.payer,
        t.payee,
        t.created_at,
        tul.tenant_name
    from transactions as t
    join tenant_unit_leases as tul on t.payer = tul.tenant_name
    where t.type = 'charge'
    and t.amount = tul.rent
)

select * from final