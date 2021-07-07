{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_num_contacted_notes_hashid
from {{ ref('hubspot_contacts_ass__s_num_contacted_notes_ab3') }}
-- num_contacted_notes at hubspot_contacts/associated-company/properties/num_contacted_notes from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

