{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_fields_hashid,
    cast({{ adapter.quote('data') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('data') }},
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast(message as {{ dbt_utils.type_string() }}) as message,
    {{ cast_to_boolean('usedefaultblocklist') }} as usedefaultblocklist,
    blockedemailaddresses,
    _airbyte_emitted_at
from {{ ref('hubspot_forms_formfi__ups_fields_validation_ab1') }}
-- validation at hubspot_forms/formFieldGroups/fields/validation

