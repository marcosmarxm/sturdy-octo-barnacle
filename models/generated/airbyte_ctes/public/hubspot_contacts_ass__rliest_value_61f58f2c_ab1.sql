{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('first_conversion_dat__rliest_value_61f58f2c', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('first_conversion_dat__rliest_value_61f58f2c', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('first_conversion_dat__rliest_value_61f58f2c', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('first_conversion_dat__rliest_value_61f58f2c', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where first_conversion_dat__rliest_value_61f58f2c is not null
-- first_conversion_dat__rliest_value_61f58f2c at hubspot_contacts/associated-company/properties/first_conversion_date_timestamp_earliest_value_61f58f2c

