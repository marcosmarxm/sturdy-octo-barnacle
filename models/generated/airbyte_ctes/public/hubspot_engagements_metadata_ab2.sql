{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_engagements_hashid,
    cc,
    {{ adapter.quote('to') }},
    bcc,
    cast(body as {{ dbt_utils.type_string() }}) as body,
    cast({{ adapter.quote('from') }} as {{ type_json() }}) as {{ adapter.quote('from') }},
    cast(html as {{ dbt_utils.type_string() }}) as html,
    cast({{ adapter.quote('text') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('text') }},
    cast(title as {{ dbt_utils.type_string() }}) as title,
    cast(status as {{ dbt_utils.type_string() }}) as status,
    cast(endtime as {{ dbt_utils.type_bigint() }}) as endtime,
    cast(subject as {{ dbt_utils.type_string() }}) as subject,
    cast(tonumber as {{ dbt_utils.type_string() }}) as tonumber,
    cast(starttime as {{ dbt_utils.type_bigint() }}) as starttime,
    cast(externalid as {{ dbt_utils.type_string() }}) as externalid,
    cast(fromnumber as {{ dbt_utils.type_string() }}) as fromnumber,
    cast(disposition as {{ dbt_utils.type_string() }}) as disposition,
    cast(recordingurl as {{ dbt_utils.type_string() }}) as recordingurl,
    cast(forobjecttype as {{ dbt_utils.type_string() }}) as forobjecttype,
    cast(externalaccountid as {{ dbt_utils.type_string() }}) as externalaccountid,
    cast(durationmilliseconds as {{ dbt_utils.type_bigint() }}) as durationmilliseconds,
    _airbyte_emitted_at
from {{ ref('hubspot_engagements_metadata_ab1') }}
-- metadata at hubspot_engagements/metadata

