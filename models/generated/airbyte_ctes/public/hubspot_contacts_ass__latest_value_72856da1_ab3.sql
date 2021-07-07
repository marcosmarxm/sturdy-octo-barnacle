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
    ]) }} as _airbyte_recent_conv__value_72856da1_hashid
from {{ ref('hubspot_contacts_ass__latest_value_72856da1_ab2') }}
-- recent_conversion_da__latest_value_72856da1 at hubspot_contacts/associated-company/properties/recent_conversion_date_timestamp_latest_value_72856da1

