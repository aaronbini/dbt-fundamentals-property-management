with email_delivery_statuses as (
    select
        id as email_delivery_status_id,
        event,
        email_id
    from {{ source('property_management', 'email_delivery_statuses') }}
)

select * from email_delivery_statuses