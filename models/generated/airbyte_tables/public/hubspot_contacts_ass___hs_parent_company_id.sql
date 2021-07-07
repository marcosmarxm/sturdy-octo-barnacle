{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_parent_company_id_hashid
from {{ ref('hubspot_contacts_ass___hs_parent_company_id_ab3') }}
-- hs_parent_company_id at hubspot_contacts/associated-company/properties/hs_parent_company_id from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

