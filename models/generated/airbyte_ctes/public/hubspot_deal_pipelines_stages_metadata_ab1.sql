{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_stages_hashid,
    {{ json_extract_scalar('metadata', ['isClosed']) }} as isclosed,
    {{ json_extract_scalar('metadata', ['probability']) }} as probability,
    _airbyte_emitted_at
from {{ ref('hubspot_deal_pipelines_stages') }}
where metadata is not null
-- metadata at hubspot_deal_pipelines/stages/metadata

