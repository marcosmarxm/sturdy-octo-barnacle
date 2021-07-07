{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_num_child_companies_hashid
from {{ ref('hubspot_contacts_ass__s_num_child_companies_ab3') }}
-- hs_num_child_companies at hubspot_contacts/associated-company/properties/hs_num_child_companies from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

