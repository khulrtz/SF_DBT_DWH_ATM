
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{%- set columns = adapter.get_columns_in_relation(this) -%}

with source_data as (

    select 1 as id, 2 AS ID2
    union all
    select null id,3 AS ID2 

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
