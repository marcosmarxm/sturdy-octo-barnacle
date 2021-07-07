{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_forms_hashid',
        array_to_string('fields'),
        boolean_to_string(adapter.quote('default')),
        'richtext',
        boolean_to_string('issmartgroup'),
    ]) }} as _airbyte_formfieldgroups_hashid
from {{ ref('hubspot_forms_formfieldgroups_ab2') }}
-- formfieldgroups at hubspot_forms/formFieldGroups

