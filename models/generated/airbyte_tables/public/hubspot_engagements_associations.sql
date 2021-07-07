{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_engagements_hashid,
    dealids,
    companyids,
    contactids,
    _airbyte_emitted_at,
    _airbyte_associations_hashid
from {{ ref('hubspot_engagements_associations_ab3') }}
-- associations at hubspot_engagements/associations from {{ ref('hubspot_engagements') }}

