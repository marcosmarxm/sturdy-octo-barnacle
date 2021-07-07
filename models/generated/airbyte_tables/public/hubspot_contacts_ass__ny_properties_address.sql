{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_address_hashid
from {{ ref('hubspot_contacts_ass__ny_properties_address_ab3') }}
-- address at hubspot_contacts/associated-company/properties/address from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

