{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['id']) }} as {{ adapter.quote('id') }},
    {{ json_extract_scalar('_airbyte_data', ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('_airbyte_data', ['type']) }} as {{ adapter.quote('type') }},
    {{ json_extract_scalar('_airbyte_data', ['appId']) }} as appid,
    {{ json_extract_scalar('_airbyte_data', ['appName']) }} as appname,
    {{ json_extract_scalar('_airbyte_data', ['subType']) }} as subtype,
    {{ json_extract_scalar('_airbyte_data', ['subject']) }} as subject,
    {{ json_extract('_airbyte_data', ['counters']) }} as counters,
    {{ json_extract_scalar('_airbyte_data', ['contentId']) }} as contentid,
    {{ json_extract_scalar('_airbyte_data', ['numQueued']) }} as numqueued,
    {{ json_extract_scalar('_airbyte_data', ['numIncluded']) }} as numincluded,
    {{ json_extract_scalar('_airbyte_data', ['lastUpdatedTime']) }} as lastupdatedtime,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_hubspot_campaigns') }}
-- hubspot_campaigns

