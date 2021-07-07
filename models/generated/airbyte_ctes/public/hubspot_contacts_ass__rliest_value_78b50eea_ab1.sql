{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('first_contact_create__rliest_value_78b50eea', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('first_contact_create__rliest_value_78b50eea', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('first_contact_create__rliest_value_78b50eea', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('first_contact_create__rliest_value_78b50eea', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where first_contact_create__rliest_value_78b50eea is not null
-- first_contact_create__rliest_value_78b50eea at hubspot_contacts/associated-company/properties/first_contact_createdate_timestamp_earliest_value_78b50eea

