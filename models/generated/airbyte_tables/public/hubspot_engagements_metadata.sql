{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_engagements_hashid,
    cc,
    {{ adapter.quote('to') }},
    bcc,
    body,
    {{ adapter.quote('from') }},
    html,
    {{ adapter.quote('text') }},
    title,
    status,
    endtime,
    subject,
    tonumber,
    starttime,
    externalid,
    fromnumber,
    disposition,
    recordingurl,
    forobjecttype,
    externalaccountid,
    durationmilliseconds,
    _airbyte_emitted_at,
    _airbyte_metadata_hashid
from {{ ref('hubspot_engagements_metadata_ab3') }}
-- metadata at hubspot_engagements/metadata from {{ ref('hubspot_engagements') }}

