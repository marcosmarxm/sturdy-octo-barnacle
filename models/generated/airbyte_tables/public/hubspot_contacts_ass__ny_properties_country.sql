{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_country_hashid
from {{ ref('hubspot_contacts_ass__ny_properties_country_ab3') }}
-- country at hubspot_contacts/associated-company/properties/country from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

