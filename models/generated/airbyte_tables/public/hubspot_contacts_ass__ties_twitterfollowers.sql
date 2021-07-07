{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_twitterfollowers_hashid
from {{ ref('hubspot_contacts_ass__ties_twitterfollowers_ab3') }}
-- twitterfollowers at hubspot_contacts/associated-company/properties/twitterfollowers from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

