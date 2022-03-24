
{%- set source_relation = adapter.get_relation(
      database='SF_DBT_DWH_ATM',
      schema='DBT_DEV',
      identifier='MAPEOS') -%}


{{ log("Source Relation: " ~ source_relation, info=true) }}