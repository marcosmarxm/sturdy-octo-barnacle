{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_workflows_hashid,
    steps,
    cast(active as {{ dbt_utils.type_bigint() }}) as active,
    cast(enrolled as {{ dbt_utils.type_bigint() }}) as enrolled,
    _airbyte_emitted_at
from {{ ref('hubspot_workflows_contactlistids_ab1') }}
-- contactlistids at hubspot_workflows/contactListIds

