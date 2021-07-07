{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_contacts_hashid,
    cast({{ adapter.quote('user-id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('user-id') }},
    cast({{ adapter.quote('timestamp') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('timestamp') }},
    cast({{ adapter.quote('vid-to-merge') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('vid-to-merge') }},
    cast({{ adapter.quote('canonical-vid') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('canonical-vid') }},
    cast(merged_to_email as {{ type_json() }}) as merged_to_email,
    cast(merged_from_email as {{ type_json() }}) as merged_from_email,
    cast({{ adapter.quote('num-properties-moved') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('num-properties-moved') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_merge_audits_ab1') }}
-- merge_audits at hubspot_contacts/merge-audits

