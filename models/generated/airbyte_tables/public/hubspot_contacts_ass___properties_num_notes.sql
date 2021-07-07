{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_num_notes_hashid
from {{ ref('hubspot_contacts_ass___properties_num_notes_ab3') }}
-- num_notes at hubspot_contacts/associated-company/properties/num_notes from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

