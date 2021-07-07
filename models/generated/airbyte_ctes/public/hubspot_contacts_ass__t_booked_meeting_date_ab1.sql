{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('hs_last_booked_meeting_date', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('hs_last_booked_meeting_date', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('hs_last_booked_meeting_date', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('hs_last_booked_meeting_date', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where hs_last_booked_meeting_date is not null
-- hs_last_booked_meeting_date at hubspot_contacts/associated-company/properties/hs_last_booked_meeting_date

