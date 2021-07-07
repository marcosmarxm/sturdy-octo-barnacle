{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['label']) }} as {{ adapter.quote('label') }},
    {{ json_extract_scalar('_airbyte_data', ['active']) }} as active,
    {{ json_extract_array('_airbyte_data', ['stages']) }} as stages,
    {{ json_extract_scalar('_airbyte_data', ['default']) }} as {{ adapter.quote('default') }},
    {{ json_extract_scalar('_airbyte_data', ['createdAt']) }} as createdat,
    {{ json_extract_scalar('_airbyte_data', ['updatedAt']) }} as updatedat,
    {{ json_extract_scalar('_airbyte_data', ['objectType']) }} as objecttype,
    {{ json_extract_scalar('_airbyte_data', ['pipelineId']) }} as pipelineid,
    {{ json_extract_scalar('_airbyte_data', ['displayOrder']) }} as displayorder,
    {{ json_extract_scalar('_airbyte_data', ['objectTypeId']) }} as objecttypeid,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_hubspot_deal_pipelines') }}
-- hubspot_deal_pipelines

