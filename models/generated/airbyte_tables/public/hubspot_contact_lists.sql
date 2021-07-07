{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('name') }},
    listid,
    {{ adapter.quote('dynamic') }},
    filters,
    archived,
    listtype,
    metadata,
    parentid,
    portalid,
    readonly,
    createdat,
    updatedat,
    deleteable,
    internallistid,
    _airbyte_emitted_at,
    _airbyte_hubspot_contact_lists_hashid
from {{ ref('hubspot_contact_lists_ab3') }}
-- hubspot_contact_lists from {{ source('public', '_airbyte_raw_hubspot_contact_lists') }}

