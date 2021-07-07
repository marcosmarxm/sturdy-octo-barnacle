{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_contacts_hashid',
        'vid',
        array_to_string('identities'),
        adapter.quote('saved-at-timestamp'),
        adapter.quote('deleted-changed-timestamp'),
    ]) }} as _airbyte_identity_profiles_hashid
from {{ ref('hubspot_contacts_identity_profiles_ab2') }}
-- identity_profiles at hubspot_contacts/identity-profiles

