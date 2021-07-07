{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_user_ids_of_all_owners_hashid
from {{ ref('hubspot_contacts_ass__ser_ids_of_all_owners_ab3') }}
-- hs_user_ids_of_all_owners at hubspot_contacts/associated-company/properties/hs_user_ids_of_all_owners from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

