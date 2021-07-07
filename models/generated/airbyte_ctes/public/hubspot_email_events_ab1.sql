{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['id']) }} as {{ adapter.quote('id') }},
    {{ json_extract_scalar('_airbyte_data', ['url']) }} as url,
    {{ json_extract_scalar('_airbyte_data', ['from']) }} as {{ adapter.quote('from') }},
    {{ json_extract_scalar('_airbyte_data', ['hmid']) }} as hmid,
    {{ json_extract_scalar('_airbyte_data', ['type']) }} as {{ adapter.quote('type') }},
    {{ json_extract_scalar('_airbyte_data', ['appId']) }} as appid,
    {{ json_extract_scalar('_airbyte_data', ['linkId']) }} as linkid,
    {{ json_extract('_airbyte_data', ['sentBy']) }} as sentby,
    {{ json_extract_scalar('_airbyte_data', ['smtpId']) }} as smtpid,
    {{ json_extract_scalar('_airbyte_data', ['appName']) }} as appname,
    {{ json_extract('_airbyte_data', ['browser']) }} as browser,
    {{ json_extract_scalar('_airbyte_data', ['created']) }} as created,
    {{ json_extract_scalar('_airbyte_data', ['subject']) }} as subject,
    {{ json_extract_scalar('_airbyte_data', ['duration']) }} as duration,
    {{ json_extract('_airbyte_data', ['location']) }} as {{ adapter.quote('location') }},
    {{ json_extract_scalar('_airbyte_data', ['portalId']) }} as portalid,
    {{ json_extract_scalar('_airbyte_data', ['response']) }} as response,
    {{ json_extract_scalar('_airbyte_data', ['ipAddress']) }} as ipaddress,
    {{ json_extract_scalar('_airbyte_data', ['recipient']) }} as recipient,
    {{ json_extract_scalar('_airbyte_data', ['userAgent']) }} as useragent,
    {{ json_extract_scalar('_airbyte_data', ['deviceType']) }} as devicetype,
    {{ json_extract_scalar('_airbyte_data', ['filteredEvent']) }} as filteredevent,
    {{ json_extract_scalar('_airbyte_data', ['emailCampaignId']) }} as emailcampaignid,
    {{ json_extract_scalar('_airbyte_data', ['emailCampaignGroupId']) }} as emailcampaigngroupid,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_hubspot_email_events') }}
-- hubspot_email_events

