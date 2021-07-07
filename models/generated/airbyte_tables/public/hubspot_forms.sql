{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    guid,
    {{ adapter.quote('name') }},
    tmsid,
    {{ adapter.quote('action') }},
    {{ adapter.quote('method') }},
    cssclass,
    editable,
    formtype,
    metadata,
    portalid,
    redirect,
    cloneable,
    createdat,
    deletable,
    deletedat,
    updatedat,
    followupid,
    properties,
    submittext,
    campaignguid,
    migratedfrom,
    inlinemessage,
    captchaenabled,
    formfieldgroups,
    performablehtml,
    notifyrecipients,
    ignorecurrentvalues,
    leadnurturingcampaignid,
    _airbyte_emitted_at,
    _airbyte_hubspot_forms_hashid
from {{ ref('hubspot_forms_ab3') }}
-- hubspot_forms from {{ source('public', '_airbyte_raw_hubspot_forms') }}

