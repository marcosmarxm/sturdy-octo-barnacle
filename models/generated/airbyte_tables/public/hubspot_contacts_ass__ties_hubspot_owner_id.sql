{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hubspot_owner_id_hashid
from {{ ref('hubspot_contacts_ass__ties_hubspot_owner_id_ab3') }}
-- hubspot_owner_id at hubspot_contacts/associated-company/properties/hubspot_owner_id from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

