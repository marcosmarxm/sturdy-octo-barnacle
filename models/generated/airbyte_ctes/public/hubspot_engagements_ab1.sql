{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['id']) }} as {{ adapter.quote('id') }},
    {{ json_extract_scalar('_airbyte_data', ['type']) }} as {{ adapter.quote('type') }},
    {{ json_extract_scalar('_airbyte_data', ['active']) }} as active,
    {{ json_extract_scalar('_airbyte_data', ['ownerId']) }} as ownerid,
    {{ json_extract('_airbyte_data', ['metadata']) }} as metadata,
    {{ json_extract_scalar('_airbyte_data', ['portalId']) }} as portalid,
    {{ json_extract_scalar('_airbyte_data', ['createdAt']) }} as createdat,
    {{ json_extract_scalar('_airbyte_data', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    {{ json_extract('_airbyte_data', ['properties']) }} as properties,
    {{ json_extract_array('_airbyte_data', ['attachments']) }} as attachments,
    {{ json_extract_scalar('_airbyte_data', ['lastUpdated']) }} as lastupdated,
    {{ json_extract('_airbyte_data', ['associations']) }} as associations,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_hubspot_engagements') }}
-- hubspot_engagements

