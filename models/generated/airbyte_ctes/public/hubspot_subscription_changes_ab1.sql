{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_array('_airbyte_data', ['changes']) }} as changes,
    {{ json_extract_scalar('_airbyte_data', ['portalId']) }} as portalid,
    {{ json_extract_scalar('_airbyte_data', ['recipient']) }} as recipient,
    {{ json_extract_scalar('_airbyte_data', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_hubspot_subscription_changes') }}
-- hubspot_subscription_changes

