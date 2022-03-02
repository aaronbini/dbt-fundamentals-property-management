with properties as (
    select
        id as property_id,
        name,
        address,
        city,
        state,
        zip_code,
        type,
        year_built
    from {{ source('property_management', 'properties') }}
)

select * from properties