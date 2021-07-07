{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_all_owner_ids_hashid
from {{ ref('hubspot_contacts_ass__ties_hs_all_owner_ids_ab3') }}
-- hs_all_owner_ids at hubspot_contacts/associated-company/properties/hs_all_owner_ids from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
