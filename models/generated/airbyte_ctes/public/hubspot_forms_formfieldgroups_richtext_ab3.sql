{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_formfieldgroups_hashid',
        adapter.quote('content'),
    ]) }} as _airbyte_richtext_hashid
from {{ ref('hubspot_forms_formfieldgroups_richtext_ab2') }}
-- richtext at hubspot_forms/formFieldGroups/richText

