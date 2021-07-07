{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_owners_hashid,
    {{ adapter.quote('id') }},
    active,
    ownerid,
    portalid,
    remoteid,
    remotetype,
    _airbyte_emitted_at,
    _airbyte_remotelist_hashid
from {{ ref('hubspot_owners_remotelist_ab3') }}
-- remotelist at hubspot_owners/remoteList from {{ ref('hubspot_owners') }}

