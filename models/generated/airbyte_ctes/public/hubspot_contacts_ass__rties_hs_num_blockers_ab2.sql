{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_properties_hashid,
    cast({{ adapter.quote('value') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('value') }},
    cast({{ adapter.quote('source') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('source') }},
    cast(sourceid as {{ dbt_utils.type_string() }}) as sourceid,
    cast({{ adapter.quote('timestamp') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__rties_hs_num_blockers_ab1') }}
-- hs_num_blockers at hubspot_contacts/associated-company/properties/hs_num_blockers
