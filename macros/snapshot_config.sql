{% macro snapshot_config(database,schema,key,strategy,ts) %}
{% raw %}{{{% endraw %}   
{% set linea = literal('config(') %} {{ linea }}
{% set linea = literal('target_database=') ~ literal("'") ~ database ~ literal("',") %} {{ linea }}
{% set linea = literal('target_schema=') ~ literal("'") ~ schema~ literal("',") %} {{ linea }}
{% set linea = literal('unique_key=') ~ literal("'") ~ key ~ literal("',") %} {{ linea }}

{% set linea = literal('strategy=') ~ literal("'") ~ strategy ~ literal("',") %} {{ linea }}
{% set linea = literal('updated_at=') ~ literal("'") ~ ts ~ literal("',") %} {{ linea }}
{% set linea = literal(')') %} {{ linea }}
{% raw %}}}{% endraw %}

{% endmacro %}


