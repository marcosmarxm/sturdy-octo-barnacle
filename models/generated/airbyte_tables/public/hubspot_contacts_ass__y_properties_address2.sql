{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_address2_hashid
from {{ ref('hubspot_contacts_ass__y_properties_address2_ab3') }}
-- address2 at hubspot_contacts/associated-company/properties/address2 from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

