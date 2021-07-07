{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_latest_meeting_activity_hashid
from {{ ref('hubspot_contacts_ass__test_meeting_activity_ab3') }}
-- hs_latest_meeting_activity at hubspot_contacts/associated-company/properties/hs_latest_meeting_activity from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

