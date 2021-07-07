{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_num_decision_makers_hashid
from {{ ref('hubspot_contacts_ass__s_num_decision_makers_ab3') }}
-- hs_num_decision_makers at hubspot_contacts/associated-company/properties/hs_num_decision_makers from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

