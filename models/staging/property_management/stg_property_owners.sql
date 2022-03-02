with property_owners as (
    select
        id as property_owner_id,
        owner_id,
        property_id
    from {{ source('property_management', 'property_owners') }}
)

select * from property_owners