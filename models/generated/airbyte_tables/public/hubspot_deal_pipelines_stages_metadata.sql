{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_stages_hashid,
    isclosed,
    probability,
    _airbyte_emitted_at,
    _airbyte_metadata_hashid
from {{ ref('hubspot_deal_pipelines_stages_metadata_ab3') }}
-- metadata at hubspot_deal_pipelines/stages/metadata from {{ ref('hubspot_deal_pipelines_stages') }}

