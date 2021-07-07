{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_campaigns_hashid,
    cast({{ adapter.quote('open') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('open') }},
    cast(sent as {{ dbt_utils.type_bigint() }}) as sent,
    cast(click as {{ dbt_utils.type_bigint() }}) as click,
    cast(print as {{ dbt_utils.type_bigint() }}) as print,
    cast(reply as {{ dbt_utils.type_bigint() }}) as reply,
    cast(bounce as {{ dbt_utils.type_bigint() }}) as bounce,
    cast(dropped as {{ dbt_utils.type_bigint() }}) as dropped,
    cast({{ adapter.quote('forward') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('forward') }},
    cast({{ adapter.quote('deferred') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('deferred') }},
    cast(delivered as {{ dbt_utils.type_bigint() }}) as delivered,
    cast(processed as {{ dbt_utils.type_bigint() }}) as processed,
    cast(spamreport as {{ dbt_utils.type_bigint() }}) as spamreport,
    cast(suppressed as {{ dbt_utils.type_bigint() }}) as suppressed,
    cast(mta_dropped as {{ dbt_utils.type_bigint() }}) as mta_dropped,
    cast(statuschange as {{ dbt_utils.type_bigint() }}) as statuschange,
    cast(unsubscribed as {{ dbt_utils.type_bigint() }}) as unsubscribed,
    _airbyte_emitted_at
from {{ ref('hubspot_campaigns_counters_ab1') }}
-- counters at hubspot_campaigns/counters

