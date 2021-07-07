{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_formfieldgroups_hashid,
    cast({{ adapter.quote('content') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('content') }},
    _airbyte_emitted_at
from {{ ref('hubspot_forms_formfieldgroups_richtext_ab1') }}
-- richtext at hubspot_forms/formFieldGroups/richText

