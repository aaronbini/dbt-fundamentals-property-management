with contacts as (
    select
        id as contact_id,
        first_name,
        last_name,
        email_address,
        phone_number
    from {{ source('property_management', 'contact_infos') }}
)

select * from contacts