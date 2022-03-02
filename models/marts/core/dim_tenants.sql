with tenants as (
    select * from {{ ref('stg_tenants') }}
),

bank_accounts as (
    select * from {{ ref('stg_bank_accounts') }}
),

contact_infos as (
    select * from {{ ref('stg_contact_infos') }}
),

final as (
    select
        tenants.tenant_id,
        tenants.move_in_date,
        tenants.move_out_date,
        tenants.notice_date,
        tenants.lease_id,
        bank_accounts.name,
        bank_accounts.bank_account_number,
        bank_accounts.routing_number,
        contact_infos.contact_id,
        concat(contact_infos.first_name, ' ', contact_infos.last_name) as tenant_name,
        contact_infos.email_address,
        contact_infos.phone_number
    from tenants
    join bank_accounts using (bank_account_id)
    join contact_infos using (contact_id)
)

select * from final