{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('id') }},
    cast({{ adapter.quote('type') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('type') }},
    {{ cast_to_boolean('active') }} as active,
    cast(ownerid as {{ dbt_utils.type_bigint() }}) as ownerid,
    cast(metadata as {{ type_json() }}) as metadata,
    cast(portalid as {{ dbt_utils.type_bigint() }}) as portalid,
    cast(createdat as {{ dbt_utils.type_bigint() }}) as createdat,
    cast({{ adapter.quote('timestamp') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('timestamp') }},
    cast(properties as {{ type_json() }}) as properties,
    attachments,
    cast(lastupdated as {{ dbt_utils.type_bigint() }}) as lastupdated,
    cast(associations as {{ type_json() }}) as associations,
    _airbyte_emitted_at
from {{ ref('hubspot_engagements_ab1') }}
-- hubspot_engagements

