with apps as (
    select * from {{ ref('stg_rental_applications') }}
),

tenants as (
    select * from {{ ref('dim_tenants') }}
),

leases as (
    select * from {{ ref('stg_leases') }}
),

final as (
    select
        l.lease_id,
        l.unit_id,
        l.start_date,
        l.end_date,
        l.completed,
        t.contact_id,
        t.move_in_date,
        t.move_out_date,
        t.notice_date
    from leases as l
    join apps as a using (rental_application_id)
    join tenants as t using (lease_id)
    where a.status = 'converted_to_tenant'
)

select * from final