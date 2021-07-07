{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_first_deal_created_date_hashid
from {{ ref('hubspot_contacts_ass__rst_deal_created_date_ab3') }}
-- first_deal_created_date at hubspot_contacts/associated-company/properties/first_deal_created_date from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

