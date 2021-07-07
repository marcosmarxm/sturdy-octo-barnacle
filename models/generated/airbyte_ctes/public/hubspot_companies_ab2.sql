{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    contacts,
    cast(portalid as {{ dbt_utils.type_bigint() }}) as portalid,
    cast(companyid as {{ dbt_utils.type_bigint() }}) as companyid,
    cast(createdat as {{ dbt_utils.type_string() }}) as createdat,
    {{ cast_to_boolean('isdeleted') }} as isdeleted,
    cast(updatedat as {{ dbt_utils.type_string() }}) as updatedat,
    cast(properties as {{ type_json() }}) as properties,
    mergeaudits,
    statechanges,
    additionaldomains,
    _airbyte_emitted_at
from {{ ref('hubspot_companies_ab1') }}
-- hubspot_companies

