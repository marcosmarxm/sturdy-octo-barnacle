{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['guid']) }} as guid,
    {{ json_extract_scalar('_airbyte_data', ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('_airbyte_data', ['tmsId']) }} as tmsid,
    {{ json_extract_scalar('_airbyte_data', ['action']) }} as {{ adapter.quote('action') }},
    {{ json_extract_scalar('_airbyte_data', ['method']) }} as {{ adapter.quote('method') }},
    {{ json_extract_scalar('_airbyte_data', ['cssClass']) }} as cssclass,
    {{ json_extract_scalar('_airbyte_data', ['editable']) }} as editable,
    {{ json_extract_scalar('_airbyte_data', ['formType']) }} as formtype,
    {{ json_extract_array('_airbyte_data', ['metaData']) }} as metadata,
    {{ json_extract_scalar('_airbyte_data', ['portalId']) }} as portalid,
    {{ json_extract_scalar('_airbyte_data', ['redirect']) }} as redirect,
    {{ json_extract_scalar('_airbyte_data', ['cloneable']) }} as cloneable,
    {{ json_extract_scalar('_airbyte_data', ['createdAt']) }} as createdat,
    {{ json_extract_scalar('_airbyte_data', ['deletable']) }} as deletable,
    {{ json_extract_scalar('_airbyte_data', ['deletedAt']) }} as deletedat,
    {{ json_extract_scalar('_airbyte_data', ['updatedAt']) }} as updatedat,
    {{ json_extract_scalar('_airbyte_data', ['followUpId']) }} as followupid,
    {{ json_extract('_airbyte_data', ['properties']) }} as properties,
    {{ json_extract_scalar('_airbyte_data', ['submitText']) }} as submittext,
    {{ json_extract_scalar('_airbyte_data', ['campaignGuid']) }} as campaignguid,
    {{ json_extract_scalar('_airbyte_data', ['migratedFrom']) }} as migratedfrom,
    {{ json_extract_scalar('_airbyte_data', ['inlineMessage']) }} as inlinemessage,
    {{ json_extract_scalar('_airbyte_data', ['captchaEnabled']) }} as captchaenabled,
    {{ json_extract_array('_airbyte_data', ['formFieldGroups']) }} as formfieldgroups,
    {{ json_extract_scalar('_airbyte_data', ['performableHtml']) }} as performablehtml,
    {{ json_extract_scalar('_airbyte_data', ['notifyRecipients']) }} as notifyrecipients,
    {{ json_extract_scalar('_airbyte_data', ['ignoreCurrentValues']) }} as ignorecurrentvalues,
    {{ json_extract_scalar('_airbyte_data', ['leadNurturingCampaignId']) }} as leadnurturingcampaignid,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_hubspot_forms') }}
-- hubspot_forms

