{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_formfieldgroups_hashid,
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast({{ adapter.quote('type') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('type') }},
    cast({{ adapter.quote('label') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('label') }},
    {{ cast_to_boolean('hidden') }} as hidden,
    {{ cast_to_boolean('enabled') }} as enabled,
    {{ adapter.quote('options') }},
    {{ cast_to_boolean('required') }} as required,
    cast(fieldtype as {{ dbt_utils.type_string() }}) as fieldtype,
    cast(groupname as {{ dbt_utils.type_string() }}) as groupname,
    cast(validation as {{ type_json() }}) as validation,
    cast(description as {{ dbt_utils.type_string() }}) as description,
    {{ cast_to_boolean('labelhidden') }} as labelhidden,
    cast(placeholder as {{ dbt_utils.type_string() }}) as placeholder,
    cast(defaultvalue as {{ dbt_utils.type_string() }}) as defaultvalue,
    cast(displayorder as {{ dbt_utils.type_bigint() }}) as displayorder,
    {{ cast_to_boolean('issmartfield') }} as issmartfield,
    selectedoptions,
    cast(unselectedlabel as {{ dbt_utils.type_string() }}) as unselectedlabel,
    _airbyte_emitted_at
from {{ ref('hubspot_forms_formfieldgroups_fields_ab1') }}
-- fields at hubspot_forms/formFieldGroups/fields

