{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('first_conversion_eve__rliest_value_68ddae0a', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('first_conversion_eve__rliest_value_68ddae0a', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('first_conversion_eve__rliest_value_68ddae0a', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('first_conversion_eve__rliest_value_68ddae0a', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where first_conversion_eve__rliest_value_68ddae0a is not null
-- first_conversion_eve__rliest_value_68ddae0a at hubspot_contacts/associated-company/properties/first_conversion_event_name_timestamp_earliest_value_68ddae0a

