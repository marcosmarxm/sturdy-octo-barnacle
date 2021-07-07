{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_contacts_hashid,
    title,
    {{ adapter.quote('form-id') }},
    {{ adapter.quote('page-url') }},
    {{ adapter.quote('portal-id') }},
    {{ adapter.quote('timestamp') }},
    {{ adapter.quote('conversion-id') }},
    _airbyte_emitted_at,
    _airbyte_form_submissions_hashid
from {{ ref('hubspot_contacts_form_submissions_ab3') }}
-- form_submissions at hubspot_contacts/form-submissions from {{ ref('hubspot_contacts') }}

