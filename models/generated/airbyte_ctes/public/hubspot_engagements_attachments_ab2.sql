{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_engagements_hashid,
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('id') }},
    _airbyte_emitted_at
from {{ ref('hubspot_engagements_attachments_ab1') }}
-- attachments at hubspot_engagements/attachments

