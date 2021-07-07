{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytic__value_999a0fce_hashid
from {{ ref('hubspot_contacts_ass__latest_value_999a0fce_ab3') }}
-- hs_analytics_last_vi__latest_value_999a0fce at hubspot_contacts/associated-company/properties/hs_analytics_last_visit_timestamp_timestamp_latest_value_999a0fce from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

