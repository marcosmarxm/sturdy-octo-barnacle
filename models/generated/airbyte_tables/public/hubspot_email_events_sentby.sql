{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_email_events_hashid,
    {{ adapter.quote('id') }},
    created,
    _airbyte_emitted_at,
    _airbyte_sentby_hashid
from {{ ref('hubspot_email_events_sentby_ab3') }}
-- sentby at hubspot_email_events/sentBy from {{ ref('hubspot_email_events') }}

