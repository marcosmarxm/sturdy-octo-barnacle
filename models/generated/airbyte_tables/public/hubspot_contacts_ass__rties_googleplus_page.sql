{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_googleplus_page_hashid
from {{ ref('hubspot_contacts_ass__rties_googleplus_page_ab3') }}
-- googleplus_page at hubspot_contacts/associated-company/properties/googleplus_page from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

