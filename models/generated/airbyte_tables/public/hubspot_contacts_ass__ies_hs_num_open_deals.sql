{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_num_open_deals_hashid
from {{ ref('hubspot_contacts_ass__ies_hs_num_open_deals_ab3') }}
-- hs_num_open_deals at hubspot_contacts/associated-company/properties/hs_num_open_deals from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

