{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_is_public_hashid
from {{ ref('hubspot_contacts_ass___properties_is_public_ab3') }}
-- is_public at hubspot_contacts/associated-company/properties/is_public from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

