{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_email_events_hashid,
    {{ json_extract_scalar(adapter.quote('location'), ['city']) }} as city,
    {{ json_extract_scalar(adapter.quote('location'), ['state']) }} as {{ adapter.quote('state') }},
    {{ json_extract_scalar(adapter.quote('location'), ['country']) }} as country,
    _airbyte_emitted_at
from {{ ref('hubspot_email_events') }}
where {{ adapter.quote('location') }} is not null
-- location at hubspot_email_events/location

