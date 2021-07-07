{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('googleplus_page', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('googleplus_page', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('googleplus_page', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('googleplus_page', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where googleplus_page is not null
-- googleplus_page at hubspot_contacts/associated-company/properties/googleplus_page

