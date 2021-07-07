{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_metadata_hashid,
    {{ json_extract_scalar(adapter.quote('from'), ['email']) }} as email,
    {{ json_extract_scalar(adapter.quote('from'), ['lastName']) }} as lastname,
    {{ json_extract_scalar(adapter.quote('from'), ['firstName']) }} as firstname,
    _airbyte_emitted_at
from {{ ref('hubspot_engagements_metadata') }}
where {{ adapter.quote('from') }} is not null
-- from at hubspot_engagements/metadata/from

