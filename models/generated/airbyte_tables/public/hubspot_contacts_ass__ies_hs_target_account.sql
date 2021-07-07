{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_target_account_hashid
from {{ ref('hubspot_contacts_ass__ies_hs_target_account_ab3') }}
-- hs_target_account at hubspot_contacts/associated-company/properties/hs_target_account from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

