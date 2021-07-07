{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('hs_analytics_first_t__rliest_value_11e3a63a', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('hs_analytics_first_t__rliest_value_11e3a63a', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('hs_analytics_first_t__rliest_value_11e3a63a', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('hs_analytics_first_t__rliest_value_11e3a63a', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where hs_analytics_first_t__rliest_value_11e3a63a is not null
-- hs_analytics_first_t__rliest_value_11e3a63a at hubspot_contacts/associated-company/properties/hs_analytics_first_timestamp_timestamp_earliest_value_11e3a63a

