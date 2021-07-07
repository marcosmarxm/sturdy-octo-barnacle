{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('type') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('type') }},
    cast(email as {{ dbt_utils.type_string() }}) as email,
    cast(ownerid as {{ dbt_utils.type_bigint() }}) as ownerid,
    {{ cast_to_boolean('isactive') }} as isactive,
    cast(lastname as {{ dbt_utils.type_string() }}) as lastname,
    cast(portalid as {{ dbt_utils.type_bigint() }}) as portalid,
    cast(createdat as {{ dbt_utils.type_string() }}) as createdat,
    cast(firstname as {{ dbt_utils.type_string() }}) as firstname,
    cast(signature as {{ dbt_utils.type_string() }}) as signature,
    cast(updatedat as {{ dbt_utils.type_string() }}) as updatedat,
    remotelist,
    cast(activeuserid as {{ dbt_utils.type_bigint() }}) as activeuserid,
    {{ cast_to_boolean('hascontactsaccess') }} as hascontactsaccess,
    cast(useridincludinginactive as {{ dbt_utils.type_bigint() }}) as useridincludinginactive,
    _airbyte_emitted_at
from {{ ref('hubspot_owners_ab1') }}
-- hubspot_owners

