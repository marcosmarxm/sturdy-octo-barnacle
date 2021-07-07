{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_email_events_hashid,
    {{ json_extract_scalar('browser', ['url']) }} as url,
    {{ json_extract_scalar('browser', ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('browser', ['type']) }} as {{ adapter.quote('type') }},
    {{ json_extract_scalar('browser', ['family']) }} as {{ adapter.quote('family') }},
    {{ json_extract_scalar('browser', ['producer']) }} as producer,
    {{ json_extract_scalar('browser', ['producerUrl']) }} as producerurl,
    _airbyte_emitted_at
from {{ ref('hubspot_email_events') }}
where browser is not null
-- browser at hubspot_email_events/browser

