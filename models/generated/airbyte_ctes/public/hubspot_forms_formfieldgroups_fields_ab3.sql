{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_formfieldgroups_hashid',
        adapter.quote('name'),
        adapter.quote('type'),
        adapter.quote('label'),
        boolean_to_string('hidden'),
        boolean_to_string('enabled'),
        array_to_string(adapter.quote('options')),
        boolean_to_string('required'),
        'fieldtype',
        'groupname',
        'validation',
        'description',
        boolean_to_string('labelhidden'),
        'placeholder',
        'defaultvalue',
        'displayorder',
        boolean_to_string('issmartfield'),
        array_to_string('selectedoptions'),
        'unselectedlabel',
    ]) }} as _airbyte_fields_hashid
from {{ ref('hubspot_forms_formfieldgroups_fields_ab2') }}
-- fields at hubspot_forms/formFieldGroups/fields

