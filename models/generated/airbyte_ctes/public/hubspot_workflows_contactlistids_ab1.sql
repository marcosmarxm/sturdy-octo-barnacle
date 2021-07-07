{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_workflows_hashid,
    {{ json_extract_array('contactlistids', ['steps']) }} as steps,
    {{ json_extract_scalar('contactlistids', ['active']) }} as active,
    {{ json_extract_scalar('contactlistids', ['enrolled']) }} as enrolled,
    _airbyte_emitted_at
from {{ ref('hubspot_workflows') }}
where contactlistids is not null
-- contactlistids at hubspot_workflows/contactListIds

