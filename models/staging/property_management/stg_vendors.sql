with vendors as (
    select
        id as vendor_id,
        contact_info_id as contact_id,
        bank_account_id
    from {{ source('property_management', 'vendors') }}
)

select * from vendors