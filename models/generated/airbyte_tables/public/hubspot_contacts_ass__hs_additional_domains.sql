{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_additional_domains_hashid
from {{ ref('hubspot_contacts_ass__hs_additional_domains_ab3') }}
-- hs_additional_domains at hubspot_contacts/associated-company/properties/hs_additional_domains from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

