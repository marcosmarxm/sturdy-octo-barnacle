{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_campaigns_hashid,
    {{ adapter.quote('open') }},
    sent,
    click,
    print,
    reply,
    bounce,
    dropped,
    {{ adapter.quote('forward') }},
    {{ adapter.quote('deferred') }},
    delivered,
    processed,
    spamreport,
    suppressed,
    mta_dropped,
    statuschange,
    unsubscribed,
    _airbyte_emitted_at,
    _airbyte_counters_hashid
from {{ ref('hubspot_campaigns_counters_ab3') }}
-- counters at hubspot_campaigns/counters from {{ ref('hubspot_campaigns') }}

