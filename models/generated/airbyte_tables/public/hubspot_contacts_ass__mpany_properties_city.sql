{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_city_hashid
from {{ ref('hubspot_contacts_ass__mpany_properties_city_ab3') }}
-- city at hubspot_contacts/associated-company/properties/city from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

