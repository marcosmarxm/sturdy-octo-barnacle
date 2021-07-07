{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_contacts_hashid,
    cast(vid as {{ dbt_utils.type_bigint() }}) as vid,
    identities,
    cast({{ adapter.quote('saved-at-timestamp') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('saved-at-timestamp') }},
    cast({{ adapter.quote('deleted-changed-timestamp') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('deleted-changed-timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_identity_profiles_ab1') }}
-- identity_profiles at hubspot_contacts/identity-profiles

