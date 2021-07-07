{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_ideal_customer_profile_hashid
from {{ ref('hubspot_contacts_ass__deal_customer_profile_ab3') }}
-- hs_ideal_customer_profile at hubspot_contacts/associated-company/properties/hs_ideal_customer_profile from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

