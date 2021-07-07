{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_metadata_hashid,
    email,
    lastname,
    firstname,
    _airbyte_emitted_at,
    _airbyte_from_hashid
from {{ ref('hubspot_engagements_metadata_from_ab3') }}
-- from at hubspot_engagements/metadata/from from {{ ref('hubspot_engagements_metadata') }}

