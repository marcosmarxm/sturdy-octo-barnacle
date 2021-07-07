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
    ]) }} as _airbyte_first_conve__value_68ddae0a_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_68ddae0a_ab2') }}
-- first_conversion_eve__rliest_value_68ddae0a at hubspot_contacts/associated-company/properties/first_conversion_event_name_timestamp_earliest_value_68ddae0a

