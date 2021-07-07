{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    changes,
    cast(portalid as {{ dbt_utils.type_bigint() }}) as portalid,
    cast(recipient as {{ dbt_utils.type_string() }}) as recipient,
    cast({{ adapter.quote('timestamp') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_subscription_changes_ab1') }}
-- hubspot_subscription_changes

