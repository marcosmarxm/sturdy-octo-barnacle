{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_web_technologies_hashid
from {{ ref('hubspot_contacts_ass__ties_web_technologies_ab3') }}
-- web_technologies at hubspot_contacts/associated-company/properties/web_technologies from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

