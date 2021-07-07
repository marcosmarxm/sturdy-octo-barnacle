{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_target_a__endation_state_hashid
from {{ ref('hubspot_contacts_ass___recommendation_state_ab3') }}
-- hs_target_account_recommendation_state at hubspot_contacts/associated-company/properties/hs_target_account_recommendation_state from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

