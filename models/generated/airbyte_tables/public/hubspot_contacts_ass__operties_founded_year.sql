{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_founded_year_hashid
from {{ ref('hubspot_contacts_ass__operties_founded_year_ab3') }}
-- founded_year at hubspot_contacts/associated-company/properties/founded_year from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

