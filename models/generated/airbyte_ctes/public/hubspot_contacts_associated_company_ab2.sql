{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_contacts_hashid,
    cast({{ adapter.quote('portal-id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('portal-id') }},
    cast({{ adapter.quote('company-id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('company-id') }},
    cast(properties as {{ type_json() }}) as properties,
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_associated_company_ab1') }}
-- associated_company at hubspot_contacts/associated-company

