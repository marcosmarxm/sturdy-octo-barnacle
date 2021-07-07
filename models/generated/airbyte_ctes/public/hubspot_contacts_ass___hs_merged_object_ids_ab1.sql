{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('hs_merged_object_ids', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('hs_merged_object_ids', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('hs_merged_object_ids', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('hs_merged_object_ids', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where hs_merged_object_ids is not null
-- hs_merged_object_ids at hubspot_contacts/associated-company/properties/hs_merged_object_ids

