{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hubspot_team_id_hashid
from {{ ref('hubspot_contacts_ass__rties_hubspot_team_id_ab3') }}
-- hubspot_team_id at hubspot_contacts/associated-company/properties/hubspot_team_id from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

