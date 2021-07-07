{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytic__value_11e3a63a_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_11e3a63a_ab3') }}
-- hs_analytics_first_t__rliest_value_11e3a63a at hubspot_contacts/associated-company/properties/hs_analytics_first_timestamp_timestamp_earliest_value_11e3a63a from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

