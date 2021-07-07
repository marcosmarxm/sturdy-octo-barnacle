{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(vid as {{ dbt_utils.type_bigint() }}) as vid,
    cast(createdat as {{ dbt_utils.type_string() }}) as createdat,
    cast({{ adapter.quote('portal-id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('portal-id') }},
    cast(updatedat as {{ dbt_utils.type_string() }}) as updatedat,
    {{ cast_to_boolean(adapter.quote('is-contact')) }} as {{ adapter.quote('is-contact') }},
    cast(properties as {{ type_json() }}) as properties,
    {{ adapter.quote('merged-vids') }},
    cast({{ adapter.quote('profile-url') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('profile-url') }},
    {{ adapter.quote('merge-audits') }},
    cast({{ adapter.quote('canonical-vid') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('canonical-vid') }},
    cast({{ adapter.quote('profile-token') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('profile-token') }},
    {{ adapter.quote('form-submissions') }},
    {{ adapter.quote('list-memberships') }},
    {{ adapter.quote('identity-profiles') }},
    cast({{ adapter.quote('associated-company') }} as {{ type_json() }}) as {{ adapter.quote('associated-company') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ab1') }}
-- hubspot_contacts

