{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_changes_hashid,
    {{ adapter.quote('id') }},
    created,
    _airbyte_emitted_at,
    _airbyte_causedbyevent_hashid
from {{ ref('hubspot_subscription__changes_causedbyevent_ab3') }}
-- causedbyevent at hubspot_subscription_changes/changes/causedByEvent from {{ ref('hubspot_subscription_changes_changes') }}

