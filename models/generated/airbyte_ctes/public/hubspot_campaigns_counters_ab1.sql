{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_campaigns_hashid,
    {{ json_extract_scalar('counters', ['open']) }} as {{ adapter.quote('open') }},
    {{ json_extract_scalar('counters', ['sent']) }} as sent,
    {{ json_extract_scalar('counters', ['click']) }} as click,
    {{ json_extract_scalar('counters', ['print']) }} as print,
    {{ json_extract_scalar('counters', ['reply']) }} as reply,
    {{ json_extract_scalar('counters', ['bounce']) }} as bounce,
    {{ json_extract_scalar('counters', ['dropped']) }} as dropped,
    {{ json_extract_scalar('counters', ['forward']) }} as {{ adapter.quote('forward') }},
    {{ json_extract_scalar('counters', ['deferred']) }} as {{ adapter.quote('deferred') }},
    {{ json_extract_scalar('counters', ['delivered']) }} as delivered,
    {{ json_extract_scalar('counters', ['processed']) }} as processed,
    {{ json_extract_scalar('counters', ['spamreport']) }} as spamreport,
    {{ json_extract_scalar('counters', ['suppressed']) }} as suppressed,
    {{ json_extract_scalar('counters', ['mta_dropped']) }} as mta_dropped,
    {{ json_extract_scalar('counters', ['statuschange']) }} as statuschange,
    {{ json_extract_scalar('counters', ['unsubscribed']) }} as unsubscribed,
    _airbyte_emitted_at
from {{ ref('hubspot_campaigns') }}
where counters is not null
-- counters at hubspot_campaigns/counters

