{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_recent_conv__value_66c820bf_hashid
from {{ ref('hubspot_contacts_ass__latest_value_66c820bf_ab3') }}
-- recent_conversion_ev__latest_value_66c820bf at hubspot_contacts/associated-company/properties/recent_conversion_event_name_timestamp_latest_value_66c820bf from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

