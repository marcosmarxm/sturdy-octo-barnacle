{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytics_source_hashid
from {{ ref('hubspot_contacts_ass__s_hs_analytics_source_ab3') }}
-- hs_analytics_source at hubspot_contacts/associated-company/properties/hs_analytics_source from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

