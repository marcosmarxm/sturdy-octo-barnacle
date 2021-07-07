{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    changes,
    portalid,
    recipient,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hubspot_sub__iption_changes_hashid
from {{ ref('hubspot_subscription_changes_ab3') }}
-- hubspot_subscription_changes from {{ source('public', '_airbyte_raw_hubspot_subscription_changes') }}

