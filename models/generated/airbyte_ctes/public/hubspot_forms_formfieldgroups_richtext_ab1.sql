{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_formfieldgroups_hashid,
    {{ json_extract_scalar('richtext', ['content']) }} as {{ adapter.quote('content') }},
    _airbyte_emitted_at
from {{ ref('hubspot_forms_formfieldgroups') }}
where richtext is not null
-- richtext at hubspot_forms/formFieldGroups/richText

