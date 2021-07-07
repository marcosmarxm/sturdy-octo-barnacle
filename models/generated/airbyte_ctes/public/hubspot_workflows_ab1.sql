{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['id']) }} as {{ adapter.quote('id') }},
    {{ json_extract_scalar('_airbyte_data', ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('_airbyte_data', ['type']) }} as {{ adapter.quote('type') }},
    {{ json_extract_scalar('_airbyte_data', ['enabled']) }} as enabled,
    {{ json_extract_scalar('_airbyte_data', ['updatedAt']) }} as updatedat,
    {{ json_extract_scalar('_airbyte_data', ['insertedAt']) }} as insertedat,
    {{ json_extract_array('_airbyte_data', ['personaTagIds']) }} as personatagids,
    {{ json_extract('_airbyte_data', ['contactListIds']) }} as contactlistids,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_hubspot_workflows') }}
-- hubspot_workflows

