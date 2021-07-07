{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('engagements_last_meeting_booked_campaign', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('engagements_last_meeting_booked_campaign', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('engagements_last_meeting_booked_campaign', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('engagements_last_meeting_booked_campaign', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where engagements_last_meeting_booked_campaign is not null
-- engagements_last_meeting_booked_campaign at hubspot_contacts/associated-company/properties/engagements_last_meeting_booked_campaign

