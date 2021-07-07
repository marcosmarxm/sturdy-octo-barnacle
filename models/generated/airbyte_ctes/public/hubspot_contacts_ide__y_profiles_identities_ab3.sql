{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_identity_profiles_hashid',
        adapter.quote('type'),
        adapter.quote('value'),
        adapter.quote('timestamp'),
    ]) }} as _airbyte_identities_hashid
from {{ ref('hubspot_contacts_ide__y_profiles_identities_ab2') }}
-- identities at hubspot_contacts/identity-profiles/identities

