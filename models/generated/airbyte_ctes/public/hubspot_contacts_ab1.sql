{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['vid']) }} as vid,
    {{ json_extract_scalar('_airbyte_data', ['createdAt']) }} as createdat,
    {{ json_extract_scalar('_airbyte_data', ['portal-id']) }} as {{ adapter.quote('portal-id') }},
    {{ json_extract_scalar('_airbyte_data', ['updatedAt']) }} as updatedat,
    {{ json_extract_scalar('_airbyte_data', ['is-contact']) }} as {{ adapter.quote('is-contact') }},
    {{ json_extract('_airbyte_data', ['properties']) }} as properties,
    {{ json_extract_array('_airbyte_data', ['merged-vids']) }} as {{ adapter.quote('merged-vids') }},
    {{ json_extract_scalar('_airbyte_data', ['profile-url']) }} as {{ adapter.quote('profile-url') }},
    {{ json_extract_array('_airbyte_data', ['merge-audits']) }} as {{ adapter.quote('merge-audits') }},
    {{ json_extract_scalar('_airbyte_data', ['canonical-vid']) }} as {{ adapter.quote('canonical-vid') }},
    {{ json_extract_scalar('_airbyte_data', ['profile-token']) }} as {{ adapter.quote('profile-token') }},
    {{ json_extract_array('_airbyte_data', ['form-submissions']) }} as {{ adapter.quote('form-submissions') }},
    {{ json_extract_array('_airbyte_data', ['list-memberships']) }} as {{ adapter.quote('list-memberships') }},
    {{ json_extract_array('_airbyte_data', ['identity-profiles']) }} as {{ adapter.quote('identity-profiles') }},
    {{ json_extract('_airbyte_data', ['associated-company']) }} as {{ adapter.quote('associated-company') }},
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_hubspot_contacts') }}
-- hubspot_contacts

