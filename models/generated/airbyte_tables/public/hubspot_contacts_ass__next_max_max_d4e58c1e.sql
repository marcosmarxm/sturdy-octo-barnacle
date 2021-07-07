{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_predicti__x_max_d4e58c1e_hashid
from {{ ref('hubspot_contacts_ass__next_max_max_d4e58c1e_ab3') }}
-- hs_predictivecontact__next_max_max_d4e58c1e at hubspot_contacts/associated-company/properties/hs_predictivecontactscore_v2_next_max_max_d4e58c1e from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

