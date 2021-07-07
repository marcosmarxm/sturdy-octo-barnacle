{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_contact_lists_hashid,
    {{ json_extract_scalar('metadata', ['size']) }} as {{ adapter.quote('size') }},
    {{ json_extract_scalar('metadata', ['error']) }} as {{ adapter.quote('error') }},
    {{ json_extract_scalar('metadata', ['processing']) }} as processing,
    {{ json_extract_scalar('metadata', ['lastSizeChangeAt']) }} as lastsizechangeat,
    {{ json_extract_scalar('metadata', ['lastProcessingStateChangeAt']) }} as lastprocessingstatechangeat,
    _airbyte_emitted_at
from {{ ref('hubspot_contact_lists') }}
where metadata is not null
-- metadata at hubspot_contact_lists/metaData

