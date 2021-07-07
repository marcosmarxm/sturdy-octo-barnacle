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
    ]) }} as _airbyte_hs_is_target_account_hashid
from {{ ref('hubspot_contacts_ass___hs_is_target_account_ab2') }}
-- hs_is_target_account at hubspot_contacts/associated-company/properties/hs_is_target_account

