{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_metadata_hashid,
    email,
    _airbyte_emitted_at,
    _airbyte_cc_hashid
from {{ ref('hubspot_engagements_metadata_cc_ab3') }}
-- cc at hubspot_engagements/metadata/cc from {{ ref('hubspot_engagements_metadata') }}

