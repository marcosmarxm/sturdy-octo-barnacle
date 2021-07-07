{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytic__value_accc17ae_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_accc17ae_ab3') }}
-- hs_analytics_first_v__rliest_value_accc17ae at hubspot_contacts/associated-company/properties/hs_analytics_first_visit_timestamp_timestamp_earliest_value_accc17ae from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

