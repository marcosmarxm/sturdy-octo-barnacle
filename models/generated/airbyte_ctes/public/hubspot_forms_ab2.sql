{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(guid as {{ dbt_utils.type_string() }}) as guid,
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast(tmsid as {{ dbt_utils.type_string() }}) as tmsid,
    cast({{ adapter.quote('action') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('action') }},
    cast({{ adapter.quote('method') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('method') }},
    cast(cssclass as {{ dbt_utils.type_string() }}) as cssclass,
    {{ cast_to_boolean('editable') }} as editable,
    cast(formtype as {{ dbt_utils.type_string() }}) as formtype,
    metadata,
    cast(portalid as {{ dbt_utils.type_bigint() }}) as portalid,
    cast(redirect as {{ dbt_utils.type_string() }}) as redirect,
    {{ cast_to_boolean('cloneable') }} as cloneable,
    cast(createdat as {{ dbt_utils.type_bigint() }}) as createdat,
    {{ cast_to_boolean('deletable') }} as deletable,
    cast(deletedat as {{ dbt_utils.type_bigint() }}) as deletedat,
    cast(updatedat as {{ dbt_utils.type_bigint() }}) as updatedat,
    cast(followupid as {{ dbt_utils.type_string() }}) as followupid,
    cast(properties as {{ type_json() }}) as properties,
    cast(submittext as {{ dbt_utils.type_string() }}) as submittext,
    cast(campaignguid as {{ dbt_utils.type_string() }}) as campaignguid,
    cast(migratedfrom as {{ dbt_utils.type_string() }}) as migratedfrom,
    cast(inlinemessage as {{ dbt_utils.type_string() }}) as inlinemessage,
    {{ cast_to_boolean('captchaenabled') }} as captchaenabled,
    formfieldgroups,
    cast(performablehtml as {{ dbt_utils.type_string() }}) as performablehtml,
    cast(notifyrecipients as {{ dbt_utils.type_string() }}) as notifyrecipients,
    {{ cast_to_boolean('ignorecurrentvalues') }} as ignorecurrentvalues,
    cast(leadnurturingcampaignid as {{ dbt_utils.type_string() }}) as leadnurturingcampaignid,
    _airbyte_emitted_at
from {{ ref('hubspot_forms_ab1') }}
-- hubspot_forms

