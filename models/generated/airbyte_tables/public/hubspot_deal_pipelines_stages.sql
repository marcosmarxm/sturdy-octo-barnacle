{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_deal_pipelines_hashid,
    {{ adapter.quote('label') }},
    active,
    stageid,
    metadata,
    createdat,
    updatedat,
    displayorder,
    _airbyte_emitted_at,
    _airbyte_stages_hashid
from {{ ref('hubspot_deal_pipelines_stages_ab3') }}
-- stages at hubspot_deal_pipelines/stages from {{ ref('hubspot_deal_pipelines') }}

