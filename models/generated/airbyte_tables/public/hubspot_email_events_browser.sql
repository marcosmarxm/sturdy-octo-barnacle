{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_email_events_hashid,
    url,
    {{ adapter.quote('name') }},
    {{ adapter.quote('type') }},
    {{ adapter.quote('family') }},
    producer,
    producerurl,
    _airbyte_emitted_at,
    _airbyte_browser_hashid
from {{ ref('hubspot_email_events_browser_ab3') }}
-- browser at hubspot_email_events/browser from {{ ref('hubspot_email_events') }}

