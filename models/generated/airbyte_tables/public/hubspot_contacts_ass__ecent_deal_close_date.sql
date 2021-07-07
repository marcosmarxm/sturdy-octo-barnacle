{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_recent_deal_close_date_hashid
from {{ ref('hubspot_contacts_ass__ecent_deal_close_date_ab3') }}
-- recent_deal_close_date at hubspot_contacts/associated-company/properties/recent_deal_close_date from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

