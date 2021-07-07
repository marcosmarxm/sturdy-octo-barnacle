{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('id') }},
    {{ adapter.quote('type') }},
    active,
    ownerid,
    metadata,
    portalid,
    createdat,
    {{ adapter.quote('timestamp') }},
    properties,
    attachments,
    lastupdated,
    associations,
    _airbyte_emitted_at,
    _airbyte_hubspot_engagements_hashid
from {{ ref('hubspot_engagements_ab3') }}
-- hubspot_engagements from {{ source('public', '_airbyte_raw_hubspot_engagements') }}

