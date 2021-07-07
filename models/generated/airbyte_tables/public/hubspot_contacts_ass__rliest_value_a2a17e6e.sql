{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_closedate_t__value_a2a17e6e_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_a2a17e6e_ab3') }}
-- closedate_timestamp_earliest_value_a2a17e6e at hubspot_contacts/associated-company/properties/closedate_timestamp_earliest_value_a2a17e6e from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

