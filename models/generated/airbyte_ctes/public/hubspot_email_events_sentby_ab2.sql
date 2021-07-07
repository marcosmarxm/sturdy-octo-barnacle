{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_email_events_hashid,
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('id') }},
    cast(created as {{ dbt_utils.type_string() }}) as created,
    _airbyte_emitted_at
from {{ ref('hubspot_email_events_sentby_ab1') }}
-- sentby at hubspot_email_events/sentBy

