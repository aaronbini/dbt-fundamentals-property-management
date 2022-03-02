with properties as (
    select * from {{ ref('stg_properties') }}
),

property_owners as (
    select * from {{ ref('stg_property_owners') }}
),

units as (
    select * from {{ ref('stg_units') }}
),

grouped_units as (
    select
        property_id,
        count(unit_id) as number_of_units
    from units
    group by property_id
),

final as (
    select
        property_id,
        property_owners.property_owner_id,
        grouped_units.number_of_units
    from properties
    join property_owners using (property_id)
    join grouped_units using (property_id)
    group by 1
)

select * from final