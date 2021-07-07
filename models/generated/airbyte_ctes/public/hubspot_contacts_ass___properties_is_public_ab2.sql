{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_properties_hashid,
    {{ cast_to_boolean(adapter.quote('value')) }} as {{ adapter.quote('value') }},
    cast({{ adapter.quote('source') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('source') }},
    cast(sourceid as {{ dbt_utils.type_string() }}) as sourceid,
    cast({{ adapter.quote('timestamp') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass___properties_is_public_ab1') }}
-- is_public at hubspot_contacts/associated-company/properties/is_public

