{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_merge_audits_hashid,
    {{ json_extract_scalar('merged_to_email', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('merged_to_email', ['selected']) }} as selected,
    {{ json_extract_scalar('merged_to_email', ['source-id']) }} as {{ adapter.quote('source-id') }},
    {{ json_extract_scalar('merged_to_email', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    {{ json_extract_scalar('merged_to_email', ['source-type']) }} as {{ adapter.quote('source-type') }},
    {{ json_extract_scalar('merged_to_email', ['source-label']) }} as {{ adapter.quote('source-label') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_merge_audits') }}
where merged_to_email is not null
-- merged_to_email at hubspot_contacts/merge-audits/merged_to_email

