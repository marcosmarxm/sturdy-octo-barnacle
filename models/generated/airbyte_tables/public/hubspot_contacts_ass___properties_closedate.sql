{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_closedate_hashid
from {{ ref('hubspot_contacts_ass___properties_closedate_ab3') }}
-- closedate at hubspot_contacts/associated-company/properties/closedate from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

