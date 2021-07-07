{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_engagements_hashid,
    dealids,
    companyids,
    contactids,
    _airbyte_emitted_at
from {{ ref('hubspot_engagements_associations_ab1') }}
-- associations at hubspot_engagements/associations

