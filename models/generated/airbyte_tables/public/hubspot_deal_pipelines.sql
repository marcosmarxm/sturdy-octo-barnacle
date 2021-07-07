{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('label') }},
    active,
    stages,
    {{ adapter.quote('default') }},
    createdat,
    updatedat,
    objecttype,
    pipelineid,
    displayorder,
    objecttypeid,
    _airbyte_emitted_at,
    _airbyte_hubspot_deal_pipelines_hashid
from {{ ref('hubspot_deal_pipelines_ab3') }}
-- hubspot_deal_pipelines from {{ source('public', '_airbyte_raw_hubspot_deal_pipelines') }}

