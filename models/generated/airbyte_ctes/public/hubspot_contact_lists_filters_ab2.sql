{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_contact_lists_hashid,
    cast({{ adapter.quote('type') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('type') }},
    cast({{ adapter.quote('value') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('value') }},
    cast({{ adapter.quote('operator') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('operator') }},
    cast(property as {{ dbt_utils.type_string() }}) as property,
    cast(filterfamily as {{ dbt_utils.type_string() }}) as filterfamily,
    cast(withintimemode as {{ dbt_utils.type_string() }}) as withintimemode,
    {{ cast_to_boolean('checkpastversions') }} as checkpastversions,
    _airbyte_emitted_at
from {{ ref('hubspot_contact_lists_filters_ab1') }}
-- filters at hubspot_contact_lists/filters

