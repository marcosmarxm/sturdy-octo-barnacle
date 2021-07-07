{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_type_hashid
from {{ ref('hubspot_contacts_ass__mpany_properties_type_ab3') }}
-- type at hubspot_contacts/associated-company/properties/type from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

