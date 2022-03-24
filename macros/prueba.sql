{% macro prueba() %}

{%- set old_relation = adapter.get_relation(
      database=target.database,
      schema=target.schema,
      identifier='MY_FIRST_DBT_MODEL') -%}

{%- set backup_relation = api.Relation.create(
      database=target.database,
      schema=target.schema,
      identifier='MY_THIRD_DBT_MODEL') -%}

{% do adapter.rename_relation(old_relation, backup_relation) %}

{% endmacro %}