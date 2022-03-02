with leases as (
    select
        id as lease_id,
        unit_id,
        start_date,
        end_date,
        rental_application_id,
        completed
    from {{ source('property_management', 'leases') }}
)

select * from leases