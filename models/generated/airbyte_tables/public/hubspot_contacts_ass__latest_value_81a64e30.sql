{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytic__value_81a64e30_hashid
from {{ ref('hubspot_contacts_ass__latest_value_81a64e30_ab3') }}
-- hs_analytics_last_to__latest_value_81a64e30 at hubspot_contacts/associated-company/properties/hs_analytics_last_touch_converting_campaign_timestamp_latest_value_81a64e30 from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

