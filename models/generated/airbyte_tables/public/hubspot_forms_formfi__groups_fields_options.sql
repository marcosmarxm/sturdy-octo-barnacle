{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_fields_hashid,
    {{ adapter.quote('label') }},
    {{ adapter.quote('value') }},
    hidden,
    readonly,
    doubledata,
    description,
    displayorder,
    _airbyte_emitted_at,
    _airbyte_options_hashid
from {{ ref('hubspot_forms_formfi__groups_fields_options_ab3') }}
-- options at hubspot_forms/formFieldGroups/fields/options from {{ ref('hubspot_forms_formfieldgroups_fields') }}

