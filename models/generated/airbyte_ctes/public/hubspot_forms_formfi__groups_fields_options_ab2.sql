{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_fields_hashid,
    cast({{ adapter.quote('label') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('label') }},
    cast({{ adapter.quote('value') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('value') }},
    {{ cast_to_boolean('hidden') }} as hidden,
    {{ cast_to_boolean('readonly') }} as readonly,
    cast(doubledata as {{ dbt_utils.type_float() }}) as doubledata,
    cast(description as {{ dbt_utils.type_string() }}) as description,
    cast(displayorder as {{ dbt_utils.type_bigint() }}) as displayorder,
    _airbyte_emitted_at
from {{ ref('hubspot_forms_formfi__groups_fields_options_ab1') }}
-- options at hubspot_forms/formFieldGroups/fields/options

