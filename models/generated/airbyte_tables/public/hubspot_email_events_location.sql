{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_email_events_hashid,
    city,
    {{ adapter.quote('state') }},
    country,
    _airbyte_emitted_at,
    _airbyte_location_hashid
from {{ ref('hubspot_email_events_location_ab3') }}
-- location at hubspot_email_events/location from {{ ref('hubspot_email_events') }}

