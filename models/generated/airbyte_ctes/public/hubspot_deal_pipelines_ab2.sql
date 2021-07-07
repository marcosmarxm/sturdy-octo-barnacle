{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('label') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('label') }},
    {{ cast_to_boolean('active') }} as active,
    stages,
    {{ cast_to_boolean(adapter.quote('default')) }} as {{ adapter.quote('default') }},
    cast(createdat as {{ dbt_utils.type_bigint() }}) as createdat,
    cast(updatedat as {{ dbt_utils.type_bigint() }}) as updatedat,
    cast(objecttype as {{ dbt_utils.type_string() }}) as objecttype,
    cast(pipelineid as {{ dbt_utils.type_string() }}) as pipelineid,
    cast(displayorder as {{ dbt_utils.type_bigint() }}) as displayorder,
    cast(objecttypeid as {{ dbt_utils.type_string() }}) as objecttypeid,
    _airbyte_emitted_at
from {{ ref('hubspot_deal_pipelines_ab1') }}
-- hubspot_deal_pipelines

