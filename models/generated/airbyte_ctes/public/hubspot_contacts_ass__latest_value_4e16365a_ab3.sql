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
    ]) }} as _airbyte_hs_analytic__value_4e16365a_hashid
from {{ ref('hubspot_contacts_ass__latest_value_4e16365a_ab2') }}
-- hs_analytics_last_ti__latest_value_4e16365a at hubspot_contacts/associated-company/properties/hs_analytics_last_timestamp_timestamp_latest_value_4e16365a

