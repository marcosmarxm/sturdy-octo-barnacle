{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytic__value_25a3a52c_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_25a3a52c_ab3') }}
-- hs_analytics_source___rliest_value_25a3a52c at hubspot_contacts/associated-company/properties/hs_analytics_source_timestamp_earliest_value_25a3a52c from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

