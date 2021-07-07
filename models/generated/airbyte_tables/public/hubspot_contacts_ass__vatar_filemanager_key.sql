{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_avatar_filemanager_key_hashid
from {{ ref('hubspot_contacts_ass__vatar_filemanager_key_ab3') }}
-- hs_avatar_filemanager_key at hubspot_contacts/associated-company/properties/hs_avatar_filemanager_key from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

