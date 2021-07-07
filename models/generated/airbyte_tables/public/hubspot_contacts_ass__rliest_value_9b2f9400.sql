{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytic__value_9b2f9400_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_9b2f9400_ab3') }}
-- hs_analytics_source___rliest_value_9b2f9400 at hubspot_contacts/associated-company/properties/hs_analytics_source_data_2_timestamp_earliest_value_9b2f9400 from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

