{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_email_events_hashid,
    {{ json_extract_scalar('sentby', ['id']) }} as {{ adapter.quote('id') }},
    {{ json_extract_scalar('sentby', ['created']) }} as created,
    _airbyte_emitted_at
from {{ ref('hubspot_email_events') }}
where sentby is not null
-- sentby at hubspot_email_events/sentBy

