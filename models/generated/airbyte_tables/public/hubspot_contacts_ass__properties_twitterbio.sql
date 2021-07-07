{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_twitterbio_hashid
from {{ ref('hubspot_contacts_ass__properties_twitterbio_ab3') }}
-- twitterbio at hubspot_contacts/associated-company/properties/twitterbio from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

