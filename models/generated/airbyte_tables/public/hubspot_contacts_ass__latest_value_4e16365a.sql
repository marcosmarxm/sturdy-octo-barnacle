{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytic__value_4e16365a_hashid
from {{ ref('hubspot_contacts_ass__latest_value_4e16365a_ab3') }}
-- hs_analytics_last_ti__latest_value_4e16365a at hubspot_contacts/associated-company/properties/hs_analytics_last_timestamp_timestamp_latest_value_4e16365a from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

