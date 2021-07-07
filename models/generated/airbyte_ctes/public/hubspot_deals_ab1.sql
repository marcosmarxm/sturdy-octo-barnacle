{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['id']) }} as {{ adapter.quote('id') }},
    {{ json_extract_scalar('_airbyte_data', ['archived']) }} as archived,
    {{ json_extract_array('_airbyte_data', ['contacts']) }} as contacts,
    {{ json_extract_array('_airbyte_data', ['companies']) }} as companies,
    {{ json_extract_scalar('_airbyte_data', ['createdAt']) }} as createdat,
    {{ json_extract('_airbyte_data', ['dealstage']) }} as dealstage,
    {{ json_extract_scalar('_airbyte_data', ['updatedAt']) }} as updatedat,
    {{ json_extract('_airbyte_data', ['properties']) }} as properties,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_hubspot_deals') }}
-- hubspot_deals

