{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_name_hashid
from {{ ref('hubspot_contacts_ass__mpany_properties_name_ab3') }}
-- name at hubspot_contacts/associated-company/properties/name from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

