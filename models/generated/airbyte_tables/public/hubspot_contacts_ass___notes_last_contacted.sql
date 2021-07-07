{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_notes_last_contacted_hashid
from {{ ref('hubspot_contacts_ass___notes_last_contacted_ab3') }}
-- notes_last_contacted at hubspot_contacts/associated-company/properties/notes_last_contacted from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

