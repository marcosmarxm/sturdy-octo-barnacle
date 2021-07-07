{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_contacts_hashid,
    cast(vid as {{ dbt_utils.type_bigint() }}) as vid,
    {{ cast_to_boolean(adapter.quote('is-member')) }} as {{ adapter.quote('is-member') }},
    cast({{ adapter.quote('timestamp') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('timestamp') }},
    cast({{ adapter.quote('static-list-id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('static-list-id') }},
    cast({{ adapter.quote('internal-list-id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('internal-list-id') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_list_memberships_ab1') }}
-- list_memberships at hubspot_contacts/list-memberships

