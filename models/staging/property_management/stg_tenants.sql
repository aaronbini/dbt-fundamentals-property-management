with tenants as (
    select
        id as tenant_id,
        contact_info_id as contact_id,
        bank_account_id,
        move_in_date,
        move_out_date,
        notice_date,
        lease_id
    from {{ source('property_management', 'tenants') }}
)

select * from tenants