{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_total_revenue_hashid
from {{ ref('hubspot_contacts_ass__perties_total_revenue_ab3') }}
-- total_revenue at hubspot_contacts/associated-company/properties/total_revenue from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

