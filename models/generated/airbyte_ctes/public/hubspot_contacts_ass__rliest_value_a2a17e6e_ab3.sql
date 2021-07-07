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
    ]) }} as _airbyte_closedate_t__value_a2a17e6e_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_a2a17e6e_ab2') }}
-- closedate_timestamp_earliest_value_a2a17e6e at hubspot_contacts/associated-company/properties/closedate_timestamp_earliest_value_a2a17e6e

