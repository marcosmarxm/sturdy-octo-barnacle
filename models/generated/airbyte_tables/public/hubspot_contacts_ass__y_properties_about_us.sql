{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_about_us_hashid
from {{ ref('hubspot_contacts_ass__y_properties_about_us_ab3') }}
-- about_us at hubspot_contacts/associated-company/properties/about_us from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

