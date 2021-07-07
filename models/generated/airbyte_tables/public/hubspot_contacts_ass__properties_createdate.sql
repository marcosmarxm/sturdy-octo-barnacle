{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_createdate_hashid
from {{ ref('hubspot_contacts_ass__properties_createdate_ab3') }}
-- createdate at hubspot_contacts/associated-company/properties/createdate from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

