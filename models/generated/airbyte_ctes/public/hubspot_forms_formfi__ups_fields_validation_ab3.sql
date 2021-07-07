{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_fields_hashid',
        adapter.quote('data'),
        adapter.quote('name'),
        'message',
        boolean_to_string('usedefaultblocklist'),
        array_to_string('blockedemailaddresses'),
    ]) }} as _airbyte_validation_hashid
from {{ ref('hubspot_forms_formfi__ups_fields_validation_ab2') }}
-- validation at hubspot_forms/formFieldGroups/fields/validation

