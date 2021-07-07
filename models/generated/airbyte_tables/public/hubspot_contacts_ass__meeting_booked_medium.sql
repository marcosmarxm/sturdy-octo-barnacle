{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_engagements___booked_medium_hashid
from {{ ref('hubspot_contacts_ass__meeting_booked_medium_ab3') }}
-- engagements_last_meeting_booked_medium at hubspot_contacts/associated-company/properties/engagements_last_meeting_booked_medium from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

