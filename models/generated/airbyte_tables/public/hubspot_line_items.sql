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
    _airbyte_hubspot_line_items_hashid
from {{ ref('hubspot_line_items_ab3') }}
-- hubspot_line_items from {{ source('public', '_airbyte_raw_hubspot_line_items') }}

