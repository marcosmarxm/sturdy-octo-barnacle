{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('id') }},
    {{ cast_to_boolean('archived') }} as archived,
    cast(createdat as {{ dbt_utils.type_string() }}) as createdat,
    cast(updatedat as {{ dbt_utils.type_string() }}) as updatedat,
    cast(archivedat as {{ dbt_utils.type_string() }}) as archivedat,
    cast(properties as {{ type_json() }}) as properties,
    cast(associations as {{ type_json() }}) as associations,
    _airbyte_emitted_at
from {{ ref('hubspot_quotes_ab1') }}
-- hubspot_quotes

