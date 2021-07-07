{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_contact_lists_hashid,
    cast({{ adapter.quote('size') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('size') }},
    cast({{ adapter.quote('error') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('error') }},
    cast(processing as {{ dbt_utils.type_string() }}) as processing,
    cast(lastsizechangeat as {{ dbt_utils.type_string() }}) as lastsizechangeat,
    cast(lastprocessingstatechangeat as {{ dbt_utils.type_string() }}) as lastprocessingstatechangeat,
    _airbyte_emitted_at
from {{ ref('hubspot_contact_lists_metadata_ab1') }}
-- metadata at hubspot_contact_lists/metaData

