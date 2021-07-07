{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_recent_deal_amount_hashid
from {{ ref('hubspot_contacts_ass__es_recent_deal_amount_ab3') }}
-- recent_deal_amount at hubspot_contacts/associated-company/properties/recent_deal_amount from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

