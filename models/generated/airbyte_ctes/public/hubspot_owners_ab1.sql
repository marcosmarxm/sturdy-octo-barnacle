{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['type']) }} as {{ adapter.quote('type') }},
    {{ json_extract_scalar('_airbyte_data', ['email']) }} as email,
    {{ json_extract_scalar('_airbyte_data', ['ownerId']) }} as ownerid,
    {{ json_extract_scalar('_airbyte_data', ['isActive']) }} as isactive,
    {{ json_extract_scalar('_airbyte_data', ['lastName']) }} as lastname,
    {{ json_extract_scalar('_airbyte_data', ['portalId']) }} as portalid,
    {{ json_extract_scalar('_airbyte_data', ['createdAt']) }} as createdat,
    {{ json_extract_scalar('_airbyte_data', ['firstName']) }} as firstname,
    {{ json_extract_scalar('_airbyte_data', ['signature']) }} as signature,
    {{ json_extract_scalar('_airbyte_data', ['updatedAt']) }} as updatedat,
    {{ json_extract_array('_airbyte_data', ['remoteList']) }} as remotelist,
    {{ json_extract_scalar('_airbyte_data', ['activeUserId']) }} as activeuserid,
    {{ json_extract_scalar('_airbyte_data', ['hasContactsAccess']) }} as hascontactsaccess,
    {{ json_extract_scalar('_airbyte_data', ['userIdIncludingInactive']) }} as useridincludinginactive,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_hubspot_owners') }}
-- hubspot_owners

