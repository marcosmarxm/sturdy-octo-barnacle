{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('recent_conversion_ev__latest_value_66c820bf', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('recent_conversion_ev__latest_value_66c820bf', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('recent_conversion_ev__latest_value_66c820bf', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('recent_conversion_ev__latest_value_66c820bf', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where recent_conversion_ev__latest_value_66c820bf is not null
-- recent_conversion_ev__latest_value_66c820bf at hubspot_contacts/associated-company/properties/recent_conversion_event_name_timestamp_latest_value_66c820bf

