{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_fields_hashid,
    {{ adapter.quote('data') }},
    {{ adapter.quote('name') }},
    message,
    usedefaultblocklist,
    blockedemailaddresses,
    _airbyte_emitted_at,
    _airbyte_validation_hashid
from {{ ref('hubspot_forms_formfi__ups_fields_validation_ab3') }}
-- validation at hubspot_forms/formFieldGroups/fields/validation from {{ ref('hubspot_forms_formfieldgroups_fields') }}

