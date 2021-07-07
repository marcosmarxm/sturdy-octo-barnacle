{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_engagements_hashid,
    {{ json_extract_array('metadata', ['cc']) }} as cc,
    {{ json_extract_array('metadata', ['to']) }} as {{ adapter.quote('to') }},
    {{ json_extract_array('metadata', ['bcc']) }} as bcc,
    {{ json_extract_scalar('metadata', ['body']) }} as body,
    {{ json_extract('metadata', ['from']) }} as {{ adapter.quote('from') }},
    {{ json_extract_scalar('metadata', ['html']) }} as html,
    {{ json_extract_scalar('metadata', ['text']) }} as {{ adapter.quote('text') }},
    {{ json_extract_scalar('metadata', ['title']) }} as title,
    {{ json_extract_scalar('metadata', ['status']) }} as status,
    {{ json_extract_scalar('metadata', ['endTime']) }} as endtime,
    {{ json_extract_scalar('metadata', ['subject']) }} as subject,
    {{ json_extract_scalar('metadata', ['toNumber']) }} as tonumber,
    {{ json_extract_scalar('metadata', ['startTime']) }} as starttime,
    {{ json_extract_scalar('metadata', ['externalId']) }} as externalid,
    {{ json_extract_scalar('metadata', ['fromNumber']) }} as fromnumber,
    {{ json_extract_scalar('metadata', ['disposition']) }} as disposition,
    {{ json_extract_scalar('metadata', ['recordingUrl']) }} as recordingurl,
    {{ json_extract_scalar('metadata', ['forObjectType']) }} as forobjecttype,
    {{ json_extract_scalar('metadata', ['externalAccountId']) }} as externalaccountid,
    {{ json_extract_scalar('metadata', ['durationMilliseconds']) }} as durationmilliseconds,
    _airbyte_emitted_at
from {{ ref('hubspot_engagements') }}
where metadata is not null
-- metadata at hubspot_engagements/metadata

