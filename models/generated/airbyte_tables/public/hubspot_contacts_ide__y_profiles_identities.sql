{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_identity_profiles_hashid,
    {{ adapter.quote('type') }},
    {{ adapter.quote('value') }},
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_identities_hashid
from {{ ref('hubspot_contacts_ide__y_profiles_identities_ab3') }}
-- identities at hubspot_contacts/identity-profiles/identities from {{ ref('hubspot_contacts_identity_profiles') }}

