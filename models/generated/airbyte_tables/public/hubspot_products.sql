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
    _airbyte_hubspot_products_hashid
from {{ ref('hubspot_products_ab3') }}
-- hubspot_products from {{ source('public', '_airbyte_raw_hubspot_products') }}

