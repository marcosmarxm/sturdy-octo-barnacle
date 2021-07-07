{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    vid,
    createdat,
    {{ adapter.quote('portal-id') }},
    updatedat,
    {{ adapter.quote('is-contact') }},
    properties,
    {{ adapter.quote('merged-vids') }},
    {{ adapter.quote('profile-url') }},
    {{ adapter.quote('merge-audits') }},
    {{ adapter.quote('canonical-vid') }},
    {{ adapter.quote('profile-token') }},
    {{ adapter.quote('form-submissions') }},
    {{ adapter.quote('list-memberships') }},
    {{ adapter.quote('identity-profiles') }},
    {{ adapter.quote('associated-company') }},
    _airbyte_emitted_at,
    _airbyte_hubspot_contacts_hashid
from {{ ref('hubspot_contacts_ab3') }}
-- hubspot_contacts from {{ source('public', '_airbyte_raw_hubspot_contacts') }}

