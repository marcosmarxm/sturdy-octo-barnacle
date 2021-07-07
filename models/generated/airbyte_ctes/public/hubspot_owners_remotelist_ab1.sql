{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_owners', 'hubspot_owners', 'remotelist') }}
select
    _airbyte_hubspot_owners_hashid,
    {{ json_extract_scalar(unnested_column_value('remotelist'), ['id']) }} as {{ adapter.quote('id') }},
    {{ json_extract_scalar(unnested_column_value('remotelist'), ['active']) }} as active,
    {{ json_extract_scalar(unnested_column_value('remotelist'), ['ownerId']) }} as ownerid,
    {{ json_extract_scalar(unnested_column_value('remotelist'), ['portalId']) }} as portalid,
    {{ json_extract_scalar(unnested_column_value('remotelist'), ['remoteId']) }} as remoteid,
    {{ json_extract_scalar(unnested_column_value('remotelist'), ['remoteType']) }} as remotetype,
    _airbyte_emitted_at
from {{ ref('hubspot_owners') }}
{{ cross_join_unnest('hubspot_owners', 'remotelist') }}
where remotelist is not null
-- remotelist at hubspot_owners/remoteList

