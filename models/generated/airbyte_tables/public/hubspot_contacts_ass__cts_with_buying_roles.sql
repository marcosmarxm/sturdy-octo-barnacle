{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_num_cont__h_buying_roles_hashid
from {{ ref('hubspot_contacts_ass__cts_with_buying_roles_ab3') }}
-- hs_num_contacts_with_buying_roles at hubspot_contacts/associated-company/properties/hs_num_contacts_with_buying_roles from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

