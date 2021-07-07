{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_last_open_task_date_hashid
from {{ ref('hubspot_contacts_ass__s_last_open_task_date_ab3') }}
-- hs_last_open_task_date at hubspot_contacts/associated-company/properties/hs_last_open_task_date from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

