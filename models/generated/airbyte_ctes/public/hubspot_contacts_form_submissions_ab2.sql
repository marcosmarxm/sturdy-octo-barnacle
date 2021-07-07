{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_contacts_hashid,
    cast(title as {{ dbt_utils.type_string() }}) as title,
    cast({{ adapter.quote('form-id') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('form-id') }},
    cast({{ adapter.quote('page-url') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('page-url') }},
    cast({{ adapter.quote('portal-id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('portal-id') }},
    cast({{ adapter.quote('timestamp') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('timestamp') }},
    cast({{ adapter.quote('conversion-id') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('conversion-id') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_form_submissions_ab1') }}
-- form_submissions at hubspot_contacts/form-submissions

