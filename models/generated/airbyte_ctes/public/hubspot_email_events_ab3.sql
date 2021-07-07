{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('id'),
        'url',
        adapter.quote('from'),
        'hmid',
        adapter.quote('type'),
        'appid',
        'linkid',
        'sentby',
        'smtpid',
        'appname',
        'browser',
        'created',
        'subject',
        'duration',
        adapter.quote('location'),
        'portalid',
        'response',
        'ipaddress',
        'recipient',
        'useragent',
        'devicetype',
        boolean_to_string('filteredevent'),
        'emailcampaignid',
        'emailcampaigngroupid',
    ]) }} as _airbyte_hubspot_email_events_hashid
from {{ ref('hubspot_email_events_ab2') }}
-- hubspot_email_events

