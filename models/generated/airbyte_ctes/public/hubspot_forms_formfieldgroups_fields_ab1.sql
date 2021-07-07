{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_forms_formfieldgroups', 'formfieldgroups', 'fields') }}
select
    _airbyte_formfieldgroups_hashid,
    {{ json_extract_scalar(unnested_column_value('fields'), ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar(unnested_column_value('fields'), ['type']) }} as {{ adapter.quote('type') }},
    {{ json_extract_scalar(unnested_column_value('fields'), ['label']) }} as {{ adapter.quote('label') }},
    {{ json_extract_scalar(unnested_column_value('fields'), ['hidden']) }} as hidden,
    {{ json_extract_scalar(unnested_column_value('fields'), ['enabled']) }} as enabled,
    {{ json_extract_array(unnested_column_value('fields'), ['options']) }} as {{ adapter.quote('options') }},
    {{ json_extract_scalar(unnested_column_value('fields'), ['required']) }} as required,
    {{ json_extract_scalar(unnested_column_value('fields'), ['fieldType']) }} as fieldtype,
    {{ json_extract_scalar(unnested_column_value('fields'), ['groupName']) }} as groupname,
    {{ json_extract(unnested_column_value('fields'), ['validation']) }} as validation,
    {{ json_extract_scalar(unnested_column_value('fields'), ['description']) }} as description,
    {{ json_extract_scalar(unnested_column_value('fields'), ['labelHidden']) }} as labelhidden,
    {{ json_extract_scalar(unnested_column_value('fields'), ['placeholder']) }} as placeholder,
    {{ json_extract_scalar(unnested_column_value('fields'), ['defaultValue']) }} as defaultvalue,
    {{ json_extract_scalar(unnested_column_value('fields'), ['displayOrder']) }} as displayorder,
    {{ json_extract_scalar(unnested_column_value('fields'), ['isSmartField']) }} as issmartfield,
    {{ json_extract_array(unnested_column_value('fields'), ['selectedOptions']) }} as selectedoptions,
    {{ json_extract_scalar(unnested_column_value('fields'), ['unselectedLabel']) }} as unselectedlabel,
    _airbyte_emitted_at
from {{ ref('hubspot_forms_formfieldgroups') }}
{{ cross_join_unnest('formfieldgroups', 'fields') }}
where fields is not null
-- fields at hubspot_forms/formFieldGroups/fields

