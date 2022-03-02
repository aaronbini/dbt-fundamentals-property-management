with properties as (
    select * from {{ ref('stg_properties') }}
),

property_owners as (
    select * from {{ ref('stg_property_owners') }}
),

units as (
    select * from {{ ref('stg_units') }}
),

final as (
    select
        property_id,
        property_owners.property_owner_id,
        count(units.*) as num_units
    from properties
    join property_owners using (property_id)
    join units using (property_id)
    group by property_id
)

select * from final