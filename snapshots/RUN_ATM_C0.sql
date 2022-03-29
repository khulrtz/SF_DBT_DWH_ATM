{% snapshot SUPPLIER %}{{config(unique_key='ID_FICTICIO',)}}SELECT md5(row_number() OVER (PARTITION BY 1 ORDER BY 1)) AS ID_FICTICIO,* FROM {{ ref('SUPPLIER') }}{% endsnapshot %}
