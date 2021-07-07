{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_sub__iption_changes_hashid,
    change,
    {{ adapter.quote('source') }},
    portalid,
    {{ adapter.quote('timestamp') }},
    changetype,
    causedbyevent,
    subscriptionid,
    _airbyte_emitted_at,
    _airbyte_changes_hashid
from {{ ref('hubspot_subscription_changes_changes_ab3') }}
-- changes at hubspot_subscription_changes/changes from {{ ref('hubspot_subscription_changes') }}

