{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_total_deal_value_hashid
from {{ ref('hubspot_contacts_ass__s_hs_total_deal_value_ab3') }}
-- hs_total_deal_value at hubspot_contacts/associated-company/properties/hs_total_deal_value from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

