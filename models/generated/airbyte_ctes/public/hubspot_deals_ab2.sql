{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('id') }},
    {{ cast_to_boolean('archived') }} as archived,
    contacts,
    companies,
    cast(createdat as {{ dbt_utils.type_string() }}) as createdat,
    cast(dealstage as {{ type_json() }}) as dealstage,
    cast(updatedat as {{ dbt_utils.type_string() }}) as updatedat,
    cast(properties as {{ type_json() }}) as properties,
    _airbyte_emitted_at
from {{ ref('hubspot_deals_ab1') }}
-- hubspot_deals

