{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('id') }},
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast({{ adapter.quote('type') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('type') }},
    {{ cast_to_boolean('enabled') }} as enabled,
    cast(updatedat as {{ dbt_utils.type_bigint() }}) as updatedat,
    cast(insertedat as {{ dbt_utils.type_bigint() }}) as insertedat,
    personatagids,
    cast(contactlistids as {{ type_json() }}) as contactlistids,
    _airbyte_emitted_at
from {{ ref('hubspot_workflows_ab1') }}
-- hubspot_workflows

