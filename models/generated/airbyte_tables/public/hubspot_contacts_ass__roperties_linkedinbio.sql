{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_linkedinbio_hashid
from {{ ref('hubspot_contacts_ass__roperties_linkedinbio_ab3') }}
-- linkedinbio at hubspot_contacts/associated-company/properties/linkedinbio from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
