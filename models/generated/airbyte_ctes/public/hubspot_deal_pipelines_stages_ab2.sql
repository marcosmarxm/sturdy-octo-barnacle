{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_deal_pipelines_hashid,
    cast({{ adapter.quote('label') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('label') }},
    {{ cast_to_boolean('active') }} as active,
    cast(stageid as {{ dbt_utils.type_string() }}) as stageid,
    cast(metadata as {{ type_json() }}) as metadata,
    cast(createdat as {{ dbt_utils.type_bigint() }}) as createdat,
    cast(updatedat as {{ dbt_utils.type_bigint() }}) as updatedat,
    cast(displayorder as {{ dbt_utils.type_bigint() }}) as displayorder,
    _airbyte_emitted_at
from {{ ref('hubspot_deal_pipelines_stages_ab1') }}
-- stages at hubspot_deal_pipelines/stages

