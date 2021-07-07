{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_deal_pipelines', 'hubspot_deal_pipelines', 'stages') }}
select
    _airbyte_hubspot_deal_pipelines_hashid,
    {{ json_extract_scalar(unnested_column_value('stages'), ['label']) }} as {{ adapter.quote('label') }},
    {{ json_extract_scalar(unnested_column_value('stages'), ['active']) }} as active,
    {{ json_extract_scalar(unnested_column_value('stages'), ['stageId']) }} as stageid,
    {{ json_extract(unnested_column_value('stages'), ['metadata']) }} as metadata,
    {{ json_extract_scalar(unnested_column_value('stages'), ['createdAt']) }} as createdat,
    {{ json_extract_scalar(unnested_column_value('stages'), ['updatedAt']) }} as updatedat,
    {{ json_extract_scalar(unnested_column_value('stages'), ['displayOrder']) }} as displayorder,
    _airbyte_emitted_at
from {{ ref('hubspot_deal_pipelines') }}
{{ cross_join_unnest('hubspot_deal_pipelines', 'stages') }}
where stages is not null
-- stages at hubspot_deal_pipelines/stages

