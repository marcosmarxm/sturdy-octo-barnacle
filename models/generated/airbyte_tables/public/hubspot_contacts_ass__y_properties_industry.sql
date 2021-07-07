{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_industry_hashid
from {{ ref('hubspot_contacts_ass__y_properties_industry_ab3') }}
-- industry at hubspot_contacts/associated-company/properties/industry from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

