{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_contacts_hashid,
    vid,
    identities,
    {{ adapter.quote('saved-at-timestamp') }},
    {{ adapter.quote('deleted-changed-timestamp') }},
    _airbyte_emitted_at,
    _airbyte_identity_profiles_hashid
from {{ ref('hubspot_contacts_identity_profiles_ab3') }}
-- identity_profiles at hubspot_contacts/identity-profiles from {{ ref('hubspot_contacts') }}

