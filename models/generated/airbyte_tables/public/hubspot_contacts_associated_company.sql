{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_contacts_hashid,
    {{ adapter.quote('portal-id') }},
    {{ adapter.quote('company-id') }},
    properties,
    _airbyte_emitted_at,
    _airbyte_associated_company_hashid
from {{ ref('hubspot_contacts_associated_company_ab3') }}
-- associated_company at hubspot_contacts/associated-company from {{ ref('hubspot_contacts') }}

