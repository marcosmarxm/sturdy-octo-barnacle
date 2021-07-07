{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_engagements', 'hubspot_engagements', 'attachments') }}
select
    _airbyte_hubspot_engagements_hashid,
    {{ json_extract_scalar(unnested_column_value('attachments'), ['id']) }} as {{ adapter.quote('id') }},
    _airbyte_emitted_at
from {{ ref('hubspot_engagements') }}
{{ cross_join_unnest('hubspot_engagements', 'attachments') }}
where attachments is not null
-- attachments at hubspot_engagements/attachments

