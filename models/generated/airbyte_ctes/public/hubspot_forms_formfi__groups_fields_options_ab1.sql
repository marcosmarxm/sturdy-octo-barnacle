{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_forms_formfieldgroups_fields', 'fields', adapter.quote('options')) }}
select
    _airbyte_fields_hashid,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('options')), ['label']) }} as {{ adapter.quote('label') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('options')), ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('options')), ['hidden']) }} as hidden,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('options')), ['readOnly']) }} as readonly,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('options')), ['doubleData']) }} as doubledata,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('options')), ['description']) }} as description,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('options')), ['displayOrder']) }} as displayorder,
    _airbyte_emitted_at
from {{ ref('hubspot_forms_formfieldgroups_fields') }}
{{ cross_join_unnest('fields', adapter.quote('options')) }}
where {{ adapter.quote('options') }} is not null
-- options at hubspot_forms/formFieldGroups/fields/options

