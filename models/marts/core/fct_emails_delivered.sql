with emails as (
    select * from {{ ref('stg_emails') }}
),

email_status as (
    select * from {{ ref('stg_email_delivery_statuses') }}
),

final as (
    select
        e.email_id,
        e.sent_at,
        e.subject,
        e.body,
        e.delivered_at
    from emails as e
    join email_status as es using (email_id)
    where es.event = 'delivered'
)

select * from final