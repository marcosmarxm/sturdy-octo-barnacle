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
    ]) }} as _airbyte_num_associated_contacts_hashid
from {{ ref('hubspot_contacts_ass__m_associated_contacts_ab2') }}
-- num_associated_contacts at hubspot_contacts/associated-company/properties/num_associated_contacts

