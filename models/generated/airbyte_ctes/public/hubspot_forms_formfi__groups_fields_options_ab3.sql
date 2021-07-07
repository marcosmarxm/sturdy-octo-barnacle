{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_fields_hashid',
        adapter.quote('label'),
        adapter.quote('value'),
        boolean_to_string('hidden'),
        boolean_to_string('readonly'),
        'doubledata',
        'description',
        'displayorder',
    ]) }} as _airbyte_options_hashid
from {{ ref('hubspot_forms_formfi__groups_fields_options_ab2') }}
-- options at hubspot_forms/formFieldGroups/fields/options

