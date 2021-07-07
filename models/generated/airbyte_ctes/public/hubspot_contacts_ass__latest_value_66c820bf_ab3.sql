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
    ]) }} as _airbyte_recent_conv__value_66c820bf_hashid
from {{ ref('hubspot_contacts_ass__latest_value_66c820bf_ab2') }}
-- recent_conversion_ev__latest_value_66c820bf at hubspot_contacts/associated-company/properties/recent_conversion_event_name_timestamp_latest_value_66c820bf

