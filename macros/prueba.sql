
{%- macro pivotar(table_name='T_C1_SAT_CUSTOMER') -%}

{%- set values_query -%}
select distinct
db_origen,
tb_origen,
cl_origen,
db_destino,
tabla_destino,
cl_destino,
in_hash,
in_trim,
in_ts_scd,
in_key
from {{ ref('mapeos') }}
where TABLA_DESTINO = '{{ table_name }}'
{%- endset -%}

{%- set results = run_query(values_query) -%}

{%- for i in results -%}
    {%- if execute -%}
        {%- set db_origen = results.columns[0].values() -%}
        {%- set tb_origen = results.columns[1].values() -%}
        {%- set cl_origen = results.columns[2].values() -%}
        {%- set db_destino = results.columns[3].values() -%}
        {%- set tabla_destino = results.columns[4].values() -%}
        {%- set cl_destino = results.columns[5].values() -%}
        {%- set in_hash = results.columns[6].values() -%}
        {%- set in_trim = results.columns[7].values() -%}
        {%- set in_ts_scd = results.columns[8].values() -%}
        {%- set in_key = results.columns[9].values() -%}
        {%- else -%}
        {%- set db_origen = [] -%}
        {%- set tb_origen = [] -%}
        {%- set cl_origen = [] -%}
        {%- set db_destino = [] -%}
        {%- set tabla_destino = [] -%}
        {%- set cl_destino = [] -%}
        {%- set in_hash = [] -%}
        {%- set in_trim = [] -%}
        {%- set in_ts_scd = [] -%}
        {%- set in_key = [] -%}        
    {%- endif -%}
        {%- set db_origen = db_origen[loop.index-1] -%}
        {%- set tb_origen = tb_origen[loop.index-1] -%}
        {%- set cl_origen = cl_origen[loop.index-1] -%}
        {%- set db_destino = db_destino[loop.index-1] -%}
        {%- set tabla_destino =tabla_destino[loop.index-1] -%}
        {%- set cl_destino = cl_destino[loop.index-1] -%}
        {%- set in_hash = in_hash[loop.index-1] -%}
        {%- set in_trim = in_trim[loop.index-1] -%}
        {%- set in_ts_scd = in_ts_scd[loop.index-1] -%}
        {%- set in_key = in_key[loop.index-1] -%}
    
    {%- if in_hash == 'S' -%}
        {%- raw -%}{{{%- endraw -%}dbt_utils.surrogate_key({{- cl_origen -}}){%- raw -%}}}{%- endraw %} AS {{ cl_destino -}}
    {% else %}
    {{ cl_origen}} AS {{ cl_destino }}
    {%- endif -%}
   
   {{ campo }}

{%- endfor -%}



{%- endmacro -%}