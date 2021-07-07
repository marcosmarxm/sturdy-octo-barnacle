{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytics_source_data_1_hashid
from {{ ref('hubspot_contacts_ass__alytics_source_data_1_ab3') }}
-- hs_analytics_source_data_1 at hubspot_contacts/associated-company/properties/hs_analytics_source_data_1 from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

