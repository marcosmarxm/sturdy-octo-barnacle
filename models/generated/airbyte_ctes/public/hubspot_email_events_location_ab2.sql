{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_email_events_hashid,
    cast(city as {{ dbt_utils.type_string() }}) as city,
    cast({{ adapter.quote('state') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('state') }},
    cast(country as {{ dbt_utils.type_string() }}) as country,
    _airbyte_emitted_at
from {{ ref('hubspot_email_events_location_ab1') }}
-- location at hubspot_email_events/location

