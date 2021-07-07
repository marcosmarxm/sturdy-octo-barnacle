{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_domain_hashid
from {{ ref('hubspot_contacts_ass__any_properties_domain_ab3') }}
-- domain at hubspot_contacts/associated-company/properties/domain from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
