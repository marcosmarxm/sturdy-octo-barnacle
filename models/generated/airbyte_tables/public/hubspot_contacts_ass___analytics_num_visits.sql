{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytics_num_visits_hashid
from {{ ref('hubspot_contacts_ass___analytics_num_visits_ab3') }}
-- hs_analytics_num_visits at hubspot_contacts/associated-company/properties/hs_analytics_num_visits from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

