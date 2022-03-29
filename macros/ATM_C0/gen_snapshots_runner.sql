{% macro gen_snapshots_runner() %}
   
    {%- set snapquery -%}
    select 
    snapshot
    from {{ ref('STG_SNAPSHOTS') }}
    {%- endset -%}

    {%- set results = run_query(snapquery)  -%}
    
    {%- if execute -%}
        {%- set results_list = results.columns[0].values() -%}
    {%- else -%}
        {%- set results_list = [] -%}
    {%- endif -%}

    {% for i in results_list -%}
       {{ i }}
    {% endfor -%}

{% endmacro %}
