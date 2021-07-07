{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_owners_hashid,
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('id') }},
    {{ cast_to_boolean('active') }} as active,
    cast(ownerid as {{ dbt_utils.type_bigint() }}) as ownerid,
    cast(portalid as {{ dbt_utils.type_bigint() }}) as portalid,
    cast(remoteid as {{ dbt_utils.type_string() }}) as remoteid,
    cast(remotetype as {{ dbt_utils.type_string() }}) as remotetype,
    _airbyte_emitted_at
from {{ ref('hubspot_owners_remotelist_ab1') }}
-- remotelist at hubspot_owners/remoteList

