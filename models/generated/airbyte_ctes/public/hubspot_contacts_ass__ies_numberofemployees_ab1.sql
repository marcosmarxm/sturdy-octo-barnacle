{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('numberofemployees', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('numberofemployees', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('numberofemployees', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('numberofemployees', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where numberofemployees is not null
-- numberofemployees at hubspot_contacts/associated-company/properties/numberofemployees
