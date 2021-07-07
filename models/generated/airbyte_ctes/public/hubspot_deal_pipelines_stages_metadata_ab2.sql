{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_stages_hashid,
    cast(isclosed as {{ dbt_utils.type_string() }}) as isclosed,
    cast(probability as {{ dbt_utils.type_string() }}) as probability,
    _airbyte_emitted_at
from {{ ref('hubspot_deal_pipelines_stages_metadata_ab1') }}
-- metadata at hubspot_deal_pipelines/stages/metadata

