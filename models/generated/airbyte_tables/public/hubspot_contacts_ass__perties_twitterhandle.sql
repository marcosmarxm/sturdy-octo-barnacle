{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_twitterhandle_hashid
from {{ ref('hubspot_contacts_ass__perties_twitterhandle_ab3') }}
-- twitterhandle at hubspot_contacts/associated-company/properties/twitterhandle from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

