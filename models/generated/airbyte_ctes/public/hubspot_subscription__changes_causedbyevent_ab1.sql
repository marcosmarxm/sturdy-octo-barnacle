{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_changes_hashid,
    {{ json_extract_scalar('causedbyevent', ['id']) }} as {{ adapter.quote('id') }},
    {{ json_extract_scalar('causedbyevent', ['created']) }} as created,
    _airbyte_emitted_at
from {{ ref('hubspot_subscription_changes_changes') }}
where causedbyevent is not null
-- causedbyevent at hubspot_subscription_changes/changes/causedByEvent

