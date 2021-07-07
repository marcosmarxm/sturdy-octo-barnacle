{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_website_hashid
from {{ ref('hubspot_contacts_ass__ny_properties_website_ab3') }}
-- website at hubspot_contacts/associated-company/properties/website from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

