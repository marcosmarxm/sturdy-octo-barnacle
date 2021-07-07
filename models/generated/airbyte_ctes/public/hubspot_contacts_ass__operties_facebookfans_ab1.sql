{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('facebookfans', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('facebookfans', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('facebookfans', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('facebookfans', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where facebookfans is not null
-- facebookfans at hubspot_contacts/associated-company/properties/facebookfans

