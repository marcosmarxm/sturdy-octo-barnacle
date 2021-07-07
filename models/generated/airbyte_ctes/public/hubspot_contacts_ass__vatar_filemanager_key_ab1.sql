{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('hs_avatar_filemanager_key', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('hs_avatar_filemanager_key', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('hs_avatar_filemanager_key', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('hs_avatar_filemanager_key', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where hs_avatar_filemanager_key is not null
-- hs_avatar_filemanager_key at hubspot_contacts/associated-company/properties/hs_avatar_filemanager_key

