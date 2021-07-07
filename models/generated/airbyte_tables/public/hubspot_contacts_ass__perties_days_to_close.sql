{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_days_to_close_hashid
from {{ ref('hubspot_contacts_ass__perties_days_to_close_ab3') }}
-- days_to_close at hubspot_contacts/associated-company/properties/days_to_close from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

