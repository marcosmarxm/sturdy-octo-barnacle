{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_numberofemployees_hashid
from {{ ref('hubspot_contacts_ass__ies_numberofemployees_ab3') }}
-- numberofemployees at hubspot_contacts/associated-company/properties/numberofemployees from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

