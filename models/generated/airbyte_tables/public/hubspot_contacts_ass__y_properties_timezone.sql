{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_timezone_hashid
from {{ ref('hubspot_contacts_ass__y_properties_timezone_ab3') }}
-- timezone at hubspot_contacts/associated-company/properties/timezone from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

