{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_properties_hashid',
        boolean_to_string(adapter.quote('value')),
        adapter.quote('source'),
        'sourceid',
        adapter.quote('timestamp'),
    ]) }} as _airbyte_is_public_hashid
from {{ ref('hubspot_contacts_ass___properties_is_public_ab2') }}
-- is_public at hubspot_contacts/associated-company/properties/is_public

