{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_properties_hashid',
        adapter.quote('value'),
        adapter.quote('source'),
        'sourceid',
        adapter.quote('timestamp'),
    ]) }} as _airbyte_address2_hashid
from {{ ref('hubspot_contacts_ass__y_properties_address2_ab2') }}
-- address2 at hubspot_contacts/associated-company/properties/address2

