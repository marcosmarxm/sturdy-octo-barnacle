{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_merge_audits_hashid,
    cast({{ adapter.quote('value') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('value') }},
    {{ cast_to_boolean('selected') }} as selected,
    cast({{ adapter.quote('source-id') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('source-id') }},
    cast({{ adapter.quote('timestamp') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('timestamp') }},
    cast({{ adapter.quote('source-type') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('source-type') }},
    cast({{ adapter.quote('source-label') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('source-label') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_mer__udits_merged_to_email_ab1') }}
-- merged_to_email at hubspot_contacts/merge-audits/merged_to_email

