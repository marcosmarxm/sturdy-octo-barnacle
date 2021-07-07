{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytic__value_4757fe10_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_4757fe10_ab3') }}
-- hs_analytics_first_t__rliest_value_4757fe10 at hubspot_contacts/associated-company/properties/hs_analytics_first_touch_converting_campaign_timestamp_earliest_value_4757fe10 from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

