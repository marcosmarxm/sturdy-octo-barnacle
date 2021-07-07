{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_metadata_hashid,
    email,
    _airbyte_emitted_at,
    _airbyte_bcc_hashid
from {{ ref('hubspot_engagements_metadata_bcc_ab3') }}
-- bcc at hubspot_engagements/metadata/bcc from {{ ref('hubspot_engagements_metadata') }}

