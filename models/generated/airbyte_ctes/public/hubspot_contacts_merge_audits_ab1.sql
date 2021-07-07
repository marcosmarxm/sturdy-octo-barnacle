{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_contacts', 'hubspot_contacts', adapter.quote('merge-audits')) }}
select
    _airbyte_hubspot_contacts_hashid,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('merge-audits')), ['user-id']) }} as {{ adapter.quote('user-id') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('merge-audits')), ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('merge-audits')), ['vid-to-merge']) }} as {{ adapter.quote('vid-to-merge') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('merge-audits')), ['canonical-vid']) }} as {{ adapter.quote('canonical-vid') }},
    {{ json_extract(unnested_column_value(adapter.quote('merge-audits')), ['merged_to_email']) }} as merged_to_email,
    {{ json_extract(unnested_column_value(adapter.quote('merge-audits')), ['merged_from_email']) }} as merged_from_email,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('merge-audits')), ['num-properties-moved']) }} as {{ adapter.quote('num-properties-moved') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts') }}
{{ cross_join_unnest('hubspot_contacts', adapter.quote('merge-audits')) }}
where {{ adapter.quote('merge-audits') }} is not null
-- merge_audits at hubspot_contacts/merge-audits

