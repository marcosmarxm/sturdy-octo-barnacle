{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_updated_by_user_id_hashid
from {{ ref('hubspot_contacts_ass__hs_updated_by_user_id_ab3') }}
-- hs_updated_by_user_id at hubspot_contacts/associated-company/properties/hs_updated_by_user_id from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

