{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_lead_status_hashid
from {{ ref('hubspot_contacts_ass__erties_hs_lead_status_ab3') }}
-- hs_lead_status at hubspot_contacts/associated-company/properties/hs_lead_status from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

