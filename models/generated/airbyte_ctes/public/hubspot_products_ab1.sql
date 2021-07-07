{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['objectId']) }} as objectid,
    {{ json_extract_scalar('_airbyte_data', ['portalId']) }} as portalid,
    {{ json_extract_scalar('_airbyte_data', ['createdAt']) }} as createdat,
    {{ json_extract_scalar('_airbyte_data', ['isDeleted']) }} as isdeleted,
    {{ json_extract_scalar('_airbyte_data', ['updatedAt']) }} as updatedat,
    {{ json_extract_scalar('_airbyte_data', ['objectType']) }} as objecttype,
    {{ json_extract('_airbyte_data', ['properties']) }} as properties,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_hubspot_products') }}
-- hubspot_products

