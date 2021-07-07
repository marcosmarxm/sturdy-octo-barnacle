{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_sub__iption_changes_hashid,
    cast(change as {{ dbt_utils.type_string() }}) as change,
    cast({{ adapter.quote('source') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('source') }},
    cast(portalid as {{ dbt_utils.type_bigint() }}) as portalid,
    cast({{ adapter.quote('timestamp') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('timestamp') }},
    cast(changetype as {{ dbt_utils.type_string() }}) as changetype,
    cast(causedbyevent as {{ type_json() }}) as causedbyevent,
    cast(subscriptionid as {{ dbt_utils.type_bigint() }}) as subscriptionid,
    _airbyte_emitted_at
from {{ ref('hubspot_subscription_changes_changes_ab1') }}
-- changes at hubspot_subscription_changes/changes

