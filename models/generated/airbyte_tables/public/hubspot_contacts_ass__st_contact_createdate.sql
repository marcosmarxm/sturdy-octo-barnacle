{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_first_contact_createdate_hashid
from {{ ref('hubspot_contacts_ass__st_contact_createdate_ab3') }}
-- first_contact_createdate at hubspot_contacts/associated-company/properties/first_contact_createdate from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

