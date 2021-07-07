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
    ]) }} as _airbyte_hs_user_ids_of_all_owners_hashid
from {{ ref('hubspot_contacts_ass__ser_ids_of_all_owners_ab2') }}
-- hs_user_ids_of_all_owners at hubspot_contacts/associated-company/properties/hs_user_ids_of_all_owners

