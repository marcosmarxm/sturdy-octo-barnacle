{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast(listid as {{ dbt_utils.type_bigint() }}) as listid,
    {{ cast_to_boolean(adapter.quote('dynamic')) }} as {{ adapter.quote('dynamic') }},
    filters,
    {{ cast_to_boolean('archived') }} as archived,
    cast(listtype as {{ dbt_utils.type_string() }}) as listtype,
    cast(metadata as {{ type_json() }}) as metadata,
    cast(parentid as {{ dbt_utils.type_bigint() }}) as parentid,
    cast(portalid as {{ dbt_utils.type_bigint() }}) as portalid,
    {{ cast_to_boolean('readonly') }} as readonly,
    cast(createdat as {{ dbt_utils.type_bigint() }}) as createdat,
    cast(updatedat as {{ dbt_utils.type_bigint() }}) as updatedat,
    {{ cast_to_boolean('deleteable') }} as deleteable,
    cast(internallistid as {{ dbt_utils.type_bigint() }}) as internallistid,
    _airbyte_emitted_at
from {{ ref('hubspot_contact_lists_ab1') }}
-- hubspot_contact_lists

