{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_num_associated_contacts_hashid
from {{ ref('hubspot_contacts_ass__m_associated_contacts_ab3') }}
-- num_associated_contacts at hubspot_contacts/associated-company/properties/num_associated_contacts from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

