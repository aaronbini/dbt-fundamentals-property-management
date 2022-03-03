with leases as (
    select * from {{ ref('fct_leases_executed') }}
)

select *
from leases l1
join leases l2 on ( l1.start_date >= l2.start_date and l1.start_date <= l2.end_date and l1.unit_id = l2.unit_id and l1.lease_id != l2.lease_id )
               or ( l1.end_date >= l2.start_date and l1.end_date <= l2.end_date and l1.unit_id = l2.unit_id and l1.lease_id != l2.lease_id )
               or ( l1.end_date >= l2.end_date and l1.start_date <= l2.start_date and l1.unit_id = l2.unit_id and l1.lease_id != l2.lease_id )
