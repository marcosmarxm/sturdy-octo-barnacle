{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    objectid,
    portalid,
    createdat,
    isdeleted,
    updatedat,
    objecttype,
    properties,
    _airbyte_emitted_at,
    _airbyte_hubspot_tickets_hashid
from {{ ref('hubspot_tickets_ab3') }}
-- hubspot_tickets from {{ source('public', '_airbyte_raw_hubspot_tickets') }}

