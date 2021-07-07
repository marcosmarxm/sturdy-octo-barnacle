{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('id') }},
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast({{ adapter.quote('type') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('type') }},
    cast(appid as {{ dbt_utils.type_bigint() }}) as appid,
    cast(appname as {{ dbt_utils.type_string() }}) as appname,
    cast(subtype as {{ dbt_utils.type_string() }}) as subtype,
    cast(subject as {{ dbt_utils.type_string() }}) as subject,
    cast(counters as {{ type_json() }}) as counters,
    cast(contentid as {{ dbt_utils.type_bigint() }}) as contentid,
    cast(numqueued as {{ dbt_utils.type_bigint() }}) as numqueued,
    cast(numincluded as {{ dbt_utils.type_bigint() }}) as numincluded,
    cast(lastupdatedtime as {{ dbt_utils.type_string() }}) as lastupdatedtime,
    _airbyte_emitted_at
from {{ ref('hubspot_campaigns_ab1') }}
-- hubspot_campaigns

