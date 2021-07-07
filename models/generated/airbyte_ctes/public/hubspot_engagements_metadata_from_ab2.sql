{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_metadata_hashid,
    cast(email as {{ dbt_utils.type_string() }}) as email,
    cast(lastname as {{ dbt_utils.type_string() }}) as lastname,
    cast(firstname as {{ dbt_utils.type_string() }}) as firstname,
    _airbyte_emitted_at
from {{ ref('hubspot_engagements_metadata_from_ab1') }}
-- from at hubspot_engagements/metadata/from

