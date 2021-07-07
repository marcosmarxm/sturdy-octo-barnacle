{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_first_conta__value_78b50eea_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_78b50eea_ab3') }}
-- first_contact_create__rliest_value_78b50eea at hubspot_contacts/associated-company/properties/first_contact_createdate_timestamp_earliest_value_78b50eea from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

