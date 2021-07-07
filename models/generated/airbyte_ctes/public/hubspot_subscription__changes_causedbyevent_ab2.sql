{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_changes_hashid,
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('id') }},
    cast(created as {{ dbt_utils.type_string() }}) as created,
    _airbyte_emitted_at
from {{ ref('hubspot_subscription__changes_causedbyevent_ab1') }}
-- causedbyevent at hubspot_subscription_changes/changes/causedByEvent

