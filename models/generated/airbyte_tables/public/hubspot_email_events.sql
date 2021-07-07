{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('id') }},
    url,
    {{ adapter.quote('from') }},
    hmid,
    {{ adapter.quote('type') }},
    appid,
    linkid,
    sentby,
    smtpid,
    appname,
    browser,
    created,
    subject,
    duration,
    {{ adapter.quote('location') }},
    portalid,
    response,
    ipaddress,
    recipient,
    useragent,
    devicetype,
    filteredevent,
    emailcampaignid,
    emailcampaigngroupid,
    _airbyte_emitted_at,
    _airbyte_hubspot_email_events_hashid
from {{ ref('hubspot_email_events_ab3') }}
-- hubspot_email_events from {{ source('public', '_airbyte_raw_hubspot_email_events') }}

