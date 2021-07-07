{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(objectid as {{ dbt_utils.type_bigint() }}) as objectid,
    cast(portalid as {{ dbt_utils.type_bigint() }}) as portalid,
    cast(createdat as {{ dbt_utils.type_string() }}) as createdat,
    {{ cast_to_boolean('isdeleted') }} as isdeleted,
    cast(updatedat as {{ dbt_utils.type_string() }}) as updatedat,
    cast(objecttype as {{ dbt_utils.type_string() }}) as objecttype,
    cast(properties as {{ type_json() }}) as properties,
    _airbyte_emitted_at
from {{ ref('hubspot_products_ab1') }}
-- hubspot_products

