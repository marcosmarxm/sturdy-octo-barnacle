{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_engagements_metadata', 'metadata', 'bcc') }}
select
    _airbyte_metadata_hashid,
    {{ json_extract_scalar(unnested_column_value('bcc'), ['email']) }} as email,
    _airbyte_emitted_at
from {{ ref('hubspot_engagements_metadata') }}
{{ cross_join_unnest('metadata', 'bcc') }}
where bcc is not null
-- bcc at hubspot_engagements/metadata/bcc

