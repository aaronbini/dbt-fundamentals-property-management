with emails as (
    select
        id as email_id,
        created_at,
        sent_at,
        subject,
        body,
        delivered_at
    from {{ source('property_management', 'emails') }}
)

select * from emails