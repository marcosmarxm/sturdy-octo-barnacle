{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_fields_hashid,
    {{ json_extract_scalar('validation', ['data']) }} as {{ adapter.quote('data') }},
    {{ json_extract_scalar('validation', ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('validation', ['message']) }} as message,
    {{ json_extract_scalar('validation', ['useDefaultBlockList']) }} as usedefaultblocklist,
    {{ json_extract_array('validation', ['blockedEmailAddresses']) }} as blockedemailaddresses,
    _airbyte_emitted_at
from {{ ref('hubspot_forms_formfieldgroups_fields') }}
where validation is not null
-- validation at hubspot_forms/formFieldGroups/fields/validation

