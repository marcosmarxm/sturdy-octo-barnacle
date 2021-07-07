{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_engagements_hashid,
    {{ json_extract_array('associations', ['dealIds']) }} as dealids,
    {{ json_extract_array('associations', ['companyIds']) }} as companyids,
    {{ json_extract_array('associations', ['contactIds']) }} as contactids,
    _airbyte_emitted_at
from {{ ref('hubspot_engagements') }}
where associations is not null
-- associations at hubspot_engagements/associations

