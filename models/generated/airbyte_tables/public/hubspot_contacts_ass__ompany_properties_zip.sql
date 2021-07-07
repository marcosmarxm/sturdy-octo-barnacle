{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_zip_hashid
from {{ ref('hubspot_contacts_ass__ompany_properties_zip_ab3') }}
-- zip at hubspot_contacts/associated-company/properties/zip from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

