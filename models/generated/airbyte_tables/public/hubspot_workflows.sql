{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('id') }},
    {{ adapter.quote('name') }},
    {{ adapter.quote('type') }},
    enabled,
    updatedat,
    insertedat,
    personatagids,
    contactlistids,
    _airbyte_emitted_at,
    _airbyte_hubspot_workflows_hashid
from {{ ref('hubspot_workflows_ab3') }}
-- hubspot_workflows from {{ source('public', '_airbyte_raw_hubspot_workflows') }}

