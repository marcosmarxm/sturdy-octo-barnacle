{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytics_num_page_views_hashid
from {{ ref('hubspot_contacts_ass__lytics_num_page_views_ab3') }}
-- hs_analytics_num_page_views at hubspot_contacts/associated-company/properties/hs_analytics_num_page_views from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

