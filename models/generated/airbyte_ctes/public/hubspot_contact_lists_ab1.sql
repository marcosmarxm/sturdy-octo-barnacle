{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('_airbyte_data', ['listId']) }} as listid,
    {{ json_extract_scalar('_airbyte_data', ['dynamic']) }} as {{ adapter.quote('dynamic') }},
    {{ json_extract_array('_airbyte_data', ['filters']) }} as filters,
    {{ json_extract_scalar('_airbyte_data', ['archived']) }} as archived,
    {{ json_extract_scalar('_airbyte_data', ['listType']) }} as listtype,
    {{ json_extract('_airbyte_data', ['metaData']) }} as metadata,
    {{ json_extract_scalar('_airbyte_data', ['parentId']) }} as parentid,
    {{ json_extract_scalar('_airbyte_data', ['portalId']) }} as portalid,
    {{ json_extract_scalar('_airbyte_data', ['readOnly']) }} as readonly,
    {{ json_extract_scalar('_airbyte_data', ['createdAt']) }} as createdat,
    {{ json_extract_scalar('_airbyte_data', ['updatedAt']) }} as updatedat,
    {{ json_extract_scalar('_airbyte_data', ['deleteable']) }} as deleteable,
    {{ json_extract_scalar('_airbyte_data', ['internalListId']) }} as internallistid,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_hubspot_contact_lists') }}
-- hubspot_contact_lists

