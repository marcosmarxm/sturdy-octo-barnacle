{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hubspot_owner_assigneddate_hashid
from {{ ref('hubspot_contacts_ass__ot_owner_assigneddate_ab3') }}
-- hubspot_owner_assigneddate at hubspot_contacts/associated-company/properties/hubspot_owner_assigneddate from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

