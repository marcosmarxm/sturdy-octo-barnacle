{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('id') }},
    {{ adapter.quote('name') }},
    {{ adapter.quote('type') }},
    appid,
    appname,
    subtype,
    subject,
    counters,
    contentid,
    numqueued,
    numincluded,
    lastupdatedtime,
    _airbyte_emitted_at,
    _airbyte_hubspot_campaigns_hashid
from {{ ref('hubspot_campaigns_ab3') }}
-- hubspot_campaigns from {{ source('public', '_airbyte_raw_hubspot_campaigns') }}

