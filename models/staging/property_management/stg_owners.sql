with owners as (
    select
        id as owner_id,
        contact_info_id as contact_id,
        bank_account_id
    from {{ source('property_management', 'owners') }}
)

select * from owners