{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_formfieldgroups_hashid,
    {{ adapter.quote('name') }},
    {{ adapter.quote('type') }},
    {{ adapter.quote('label') }},
    hidden,
    enabled,
    {{ adapter.quote('options') }},
    required,
    fieldtype,
    groupname,
    validation,
    description,
    labelhidden,
    placeholder,
    defaultvalue,
    displayorder,
    issmartfield,
    selectedoptions,
    unselectedlabel,
    _airbyte_emitted_at,
    _airbyte_fields_hashid
from {{ ref('hubspot_forms_formfieldgroups_fields_ab3') }}
-- fields at hubspot_forms/formFieldGroups/fields from {{ ref('hubspot_forms_formfieldgroups') }}

