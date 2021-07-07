{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_contact_lists', 'hubspot_contact_lists', 'filters') }}
select
    _airbyte_hubspot_contact_lists_hashid,
    {{ json_extract_scalar(unnested_column_value('filters'), ['type']) }} as {{ adapter.quote('type') }},
    {{ json_extract_scalar(unnested_column_value('filters'), ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar(unnested_column_value('filters'), ['operator']) }} as {{ adapter.quote('operator') }},
    {{ json_extract_scalar(unnested_column_value('filters'), ['property']) }} as property,
    {{ json_extract_scalar(unnested_column_value('filters'), ['filterFamily']) }} as filterfamily,
    {{ json_extract_scalar(unnested_column_value('filters'), ['withinTimeMode']) }} as withintimemode,
    {{ json_extract_scalar(unnested_column_value('filters'), ['checkPastVersions']) }} as checkpastversions,
    _airbyte_emitted_at
from {{ ref('hubspot_contact_lists') }}
{{ cross_join_unnest('hubspot_contact_lists', 'filters') }}
where filters is not null
-- filters at hubspot_contact_lists/filters

