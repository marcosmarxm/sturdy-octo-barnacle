{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_state_hashid
from {{ ref('hubspot_contacts_ass__pany_properties_state_ab3') }}
-- state at hubspot_contacts/associated-company/properties/state from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

