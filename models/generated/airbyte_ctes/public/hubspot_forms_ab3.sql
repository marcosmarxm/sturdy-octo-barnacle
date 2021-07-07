{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        'guid',
        adapter.quote('name'),
        'tmsid',
        adapter.quote('action'),
        adapter.quote('method'),
        'cssclass',
        boolean_to_string('editable'),
        'formtype',
        array_to_string('metadata'),
        'portalid',
        'redirect',
        boolean_to_string('cloneable'),
        'createdat',
        boolean_to_string('deletable'),
        'deletedat',
        'updatedat',
        'followupid',
        'properties',
        'submittext',
        'campaignguid',
        'migratedfrom',
        'inlinemessage',
        boolean_to_string('captchaenabled'),
        array_to_string('formfieldgroups'),
        'performablehtml',
        'notifyrecipients',
        boolean_to_string('ignorecurrentvalues'),
        'leadnurturingcampaignid',
    ]) }} as _airbyte_hubspot_forms_hashid
from {{ ref('hubspot_forms_ab2') }}
-- hubspot_forms

