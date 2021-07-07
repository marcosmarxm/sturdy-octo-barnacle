{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        'vid',
        'createdat',
        adapter.quote('portal-id'),
        'updatedat',
        boolean_to_string(adapter.quote('is-contact')),
        'properties',
        array_to_string(adapter.quote('merged-vids')),
        adapter.quote('profile-url'),
        array_to_string(adapter.quote('merge-audits')),
        adapter.quote('canonical-vid'),
        adapter.quote('profile-token'),
        array_to_string(adapter.quote('form-submissions')),
        array_to_string(adapter.quote('list-memberships')),
        array_to_string(adapter.quote('identity-profiles')),
        adapter.quote('associated-company'),
    ]) }} as _airbyte_hubspot_contacts_hashid
from {{ ref('hubspot_contacts_ab2') }}
-- hubspot_contacts

