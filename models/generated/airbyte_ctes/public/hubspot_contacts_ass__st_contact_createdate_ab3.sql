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
    ]) }} as _airbyte_first_contact_createdate_hashid
from {{ ref('hubspot_contacts_ass__st_contact_createdate_ab2') }}
-- first_contact_createdate at hubspot_contacts/associated-company/properties/first_contact_createdate

