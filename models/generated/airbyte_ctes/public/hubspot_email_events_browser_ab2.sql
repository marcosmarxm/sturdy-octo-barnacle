{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_email_events_hashid,
    cast(url as {{ dbt_utils.type_string() }}) as url,
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast({{ adapter.quote('type') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('type') }},
    cast({{ adapter.quote('family') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('family') }},
    cast(producer as {{ dbt_utils.type_string() }}) as producer,
    cast(producerurl as {{ dbt_utils.type_string() }}) as producerurl,
    _airbyte_emitted_at
from {{ ref('hubspot_email_events_browser_ab1') }}
-- browser at hubspot_email_events/browser

