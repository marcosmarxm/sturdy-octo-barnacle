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
    ]) }} as _airbyte_hs_target_a__on_snooze_time_hashid
from {{ ref('hubspot_contacts_ass__mendation_snooze_time_ab2') }}
-- hs_target_account_re__mendation_snooze_time at hubspot_contacts/associated-company/properties/hs_target_account_recommendation_snooze_time

