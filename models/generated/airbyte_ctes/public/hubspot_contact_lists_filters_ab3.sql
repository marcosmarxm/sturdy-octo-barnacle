{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_contact_lists_hashid',
        adapter.quote('type'),
        adapter.quote('value'),
        adapter.quote('operator'),
        'property',
        'filterfamily',
        'withintimemode',
        boolean_to_string('checkpastversions'),
    ]) }} as _airbyte_filters_hashid
from {{ ref('hubspot_contact_lists_filters_ab2') }}
-- filters at hubspot_contact_lists/filters

