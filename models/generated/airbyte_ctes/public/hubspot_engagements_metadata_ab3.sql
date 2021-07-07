{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_engagements_hashid',
        array_to_string('cc'),
        array_to_string(adapter.quote('to')),
        array_to_string('bcc'),
        'body',
        adapter.quote('from'),
        'html',
        adapter.quote('text'),
        'title',
        'status',
        'endtime',
        'subject',
        'tonumber',
        'starttime',
        'externalid',
        'fromnumber',
        'disposition',
        'recordingurl',
        'forobjecttype',
        'externalaccountid',
        'durationmilliseconds',
    ]) }} as _airbyte_metadata_hashid
from {{ ref('hubspot_engagements_metadata_ab2') }}
-- metadata at hubspot_engagements/metadata

