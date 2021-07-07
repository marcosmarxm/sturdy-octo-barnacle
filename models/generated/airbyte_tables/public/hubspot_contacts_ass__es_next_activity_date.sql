{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_notes_next_activity_date_hashid
from {{ ref('hubspot_contacts_ass__es_next_activity_date_ab3') }}
-- notes_next_activity_date at hubspot_contacts/associated-company/properties/notes_next_activity_date from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

