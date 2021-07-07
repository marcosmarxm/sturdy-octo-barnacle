{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_metadata_hashid,
    email,
    _airbyte_emitted_at,
    _airbyte_to_hashid
from {{ ref('hubspot_engagements_metadata_to_ab3') }}
-- to at hubspot_engagements/metadata/to from {{ ref('hubspot_engagements_metadata') }}

