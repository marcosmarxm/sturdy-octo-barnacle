{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_linkedin_company_page_hashid
from {{ ref('hubspot_contacts_ass__linkedin_company_page_ab3') }}
-- linkedin_company_page at hubspot_contacts/associated-company/properties/linkedin_company_page from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

