{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_first_conve__value_68ddae0a_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_68ddae0a_ab3') }}
-- first_conversion_eve__rliest_value_68ddae0a at hubspot_contacts/associated-company/properties/first_conversion_event_name_timestamp_earliest_value_68ddae0a from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

