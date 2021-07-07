{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('id') }},
    cast(url as {{ dbt_utils.type_string() }}) as url,
    cast({{ adapter.quote('from') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('from') }},
    cast(hmid as {{ dbt_utils.type_string() }}) as hmid,
    cast({{ adapter.quote('type') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('type') }},
    cast(appid as {{ dbt_utils.type_bigint() }}) as appid,
    cast(linkid as {{ dbt_utils.type_bigint() }}) as linkid,
    cast(sentby as {{ type_json() }}) as sentby,
    cast(smtpid as {{ dbt_utils.type_string() }}) as smtpid,
    cast(appname as {{ dbt_utils.type_string() }}) as appname,
    cast(browser as {{ type_json() }}) as browser,
    cast(created as {{ dbt_utils.type_bigint() }}) as created,
    cast(subject as {{ dbt_utils.type_string() }}) as subject,
    cast(duration as {{ dbt_utils.type_bigint() }}) as duration,
    cast({{ adapter.quote('location') }} as {{ type_json() }}) as {{ adapter.quote('location') }},
    cast(portalid as {{ dbt_utils.type_bigint() }}) as portalid,
    cast(response as {{ dbt_utils.type_string() }}) as response,
    cast(ipaddress as {{ dbt_utils.type_string() }}) as ipaddress,
    cast(recipient as {{ dbt_utils.type_string() }}) as recipient,
    cast(useragent as {{ dbt_utils.type_string() }}) as useragent,
    cast(devicetype as {{ dbt_utils.type_string() }}) as devicetype,
    {{ cast_to_boolean('filteredevent') }} as filteredevent,
    cast(emailcampaignid as {{ dbt_utils.type_bigint() }}) as emailcampaignid,
    cast(emailcampaigngroupid as {{ dbt_utils.type_bigint() }}) as emailcampaigngroupid,
    _airbyte_emitted_at
from {{ ref('hubspot_email_events_ab1') }}
-- hubspot_email_events

