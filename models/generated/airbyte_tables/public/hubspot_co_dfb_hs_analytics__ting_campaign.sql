{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytic__rting_campaign_hashid
from {{ ref('hubspot_co_dfb_hs_analytics__ting_campaign_ab3') }}
-- hs_analytics_first_t__h_converting_campaign at hubspot_contacts/associated-company/properties/hs_analytics_first_touch_converting_campaign from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

