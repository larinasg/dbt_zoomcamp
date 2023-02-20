{{ config(materialized='view') }}

select 
cast(dispatching_base_num as string) as dispatching_base_num,		
cast(pickup_datetime as timestamp) as pickup_datetime,		
cast(dropOff_datetime as timestamp) as dropOff_datetime,		
cast(PUlocationID as integer) as pulocationid,			
cast(DOlocationID as integer) as dolocationid,		
cast(SR_Flag as string) as sr_flag,	
cast(Affiliated_base_number as string) as affiliated_base_number	
from {{ source('staging','fhv_tripdata')}}
--limit 100 