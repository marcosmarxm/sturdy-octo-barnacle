{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_phone_hashid
from {{ ref('hubspot_contacts_ass__pany_properties_phone_ab3') }}
-- phone at hubspot_contacts/associated-company/properties/phone from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

