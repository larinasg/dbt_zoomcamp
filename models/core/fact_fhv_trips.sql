{{ config(materialized='table') }}

with
dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
)
select 
stg.dispatching_base_num,		
stg.pickup_datetime,		
stg.dropOff_datetime,		
stg.pulocationid,			
stg.dolocationid,		
stg.sr_flag,	
stg.affiliated_base_number
from {{ ref('stg_fhv_tripdata') }} as stg
inner join dim_zones as pickup_zone
on stg.pulocationid = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on stg.dolocationid = dropoff_zone.locationid
