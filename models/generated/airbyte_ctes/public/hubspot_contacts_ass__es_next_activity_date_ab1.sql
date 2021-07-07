{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('notes_next_activity_date', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('notes_next_activity_date', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('notes_next_activity_date', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('notes_next_activity_date', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where notes_next_activity_date is not null
-- notes_next_activity_date at hubspot_contacts/associated-company/properties/notes_next_activity_date

