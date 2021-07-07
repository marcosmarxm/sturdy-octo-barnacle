{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_engagements_hashid,
    {{ adapter.quote('id') }},
    _airbyte_emitted_at,
    _airbyte_attachments_hashid
from {{ ref('hubspot_engagements_attachments_ab3') }}
-- attachments at hubspot_engagements/attachments from {{ ref('hubspot_engagements') }}

