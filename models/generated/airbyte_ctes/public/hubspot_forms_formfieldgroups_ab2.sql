{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_forms_hashid,
    fields,
    {{ cast_to_boolean(adapter.quote('default')) }} as {{ adapter.quote('default') }},
    cast(richtext as {{ type_json() }}) as richtext,
    {{ cast_to_boolean('issmartgroup') }} as issmartgroup,
    _airbyte_emitted_at
from {{ ref('hubspot_forms_formfieldgroups_ab1') }}
-- formfieldgroups at hubspot_forms/formFieldGroups

