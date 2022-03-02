with units as (
    select
        id as unit_id,
        rent,
        property_id,
        name,
        bedrooms,
        bathrooms,
        square_feet,
        status,
        address_1,
        address_2,
        city,
        state,
        zip_code
    from {{ source('property_management', 'units') }}
)

select * from units