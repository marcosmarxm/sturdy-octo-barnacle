{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_first_conve__value_61f58f2c_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_61f58f2c_ab3') }}
-- first_conversion_dat__rliest_value_61f58f2c at hubspot_contacts/associated-company/properties/first_conversion_date_timestamp_earliest_value_61f58f2c from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

