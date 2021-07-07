{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('recent_conversion_da__latest_value_72856da1', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('recent_conversion_da__latest_value_72856da1', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('recent_conversion_da__latest_value_72856da1', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('recent_conversion_da__latest_value_72856da1', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where recent_conversion_da__latest_value_72856da1 is not null
-- recent_conversion_da__latest_value_72856da1 at hubspot_contacts/associated-company/properties/recent_conversion_date_timestamp_latest_value_72856da1

