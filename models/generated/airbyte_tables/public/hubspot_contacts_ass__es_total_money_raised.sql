{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_total_money_raised_hashid
from {{ ref('hubspot_contacts_ass__es_total_money_raised_ab3') }}
-- total_money_raised at hubspot_contacts/associated-company/properties/total_money_raised from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

