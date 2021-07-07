{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_annualrevenue_hashid
from {{ ref('hubspot_contacts_ass__perties_annualrevenue_ab3') }}
-- annualrevenue at hubspot_contacts/associated-company/properties/annualrevenue from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

