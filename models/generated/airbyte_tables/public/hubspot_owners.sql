{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('type') }},
    email,
    ownerid,
    isactive,
    lastname,
    portalid,
    createdat,
    firstname,
    signature,
    updatedat,
    remotelist,
    activeuserid,
    hascontactsaccess,
    useridincludinginactive,
    _airbyte_emitted_at,
    _airbyte_hubspot_owners_hashid
from {{ ref('hubspot_owners_ab3') }}
-- hubspot_owners from {{ source('public', '_airbyte_raw_hubspot_owners') }}

