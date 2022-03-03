with bank_accounts as (
    select * from {{ ref('stg_bank_accounts') }}
)

select *
from bank_accounts
where len(bank_account_number) != 9
or len(routing_number) != 9