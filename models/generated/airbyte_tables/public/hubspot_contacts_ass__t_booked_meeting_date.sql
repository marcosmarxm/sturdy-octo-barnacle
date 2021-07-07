{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_last_booked_meeting_date_hashid
from {{ ref('hubspot_contacts_ass__t_booked_meeting_date_ab3') }}
-- hs_last_booked_meeting_date at hubspot_contacts/associated-company/properties/hs_last_booked_meeting_date from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

