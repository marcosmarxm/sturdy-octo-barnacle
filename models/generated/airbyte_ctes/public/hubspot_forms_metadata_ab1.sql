{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_forms', 'hubspot_forms', 'metadata') }}
select
    _airbyte_hubspot_forms_hashid,
    {{ json_extract_scalar(unnested_column_value('metadata'), ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar(unnested_column_value('metadata'), ['value']) }} as {{ adapter.quote('value') }},
    _airbyte_emitted_at
from {{ ref('hubspot_forms') }}
{{ cross_join_unnest('hubspot_forms', 'metadata') }}
where metadata is not null
-- metadata at hubspot_forms/metaData

