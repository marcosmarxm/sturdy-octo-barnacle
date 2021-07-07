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
    ]) }} as _airbyte_hs_analytic__value_999a0fce_hashid
from {{ ref('hubspot_contacts_ass__latest_value_999a0fce_ab2') }}
-- hs_analytics_last_vi__latest_value_999a0fce at hubspot_contacts/associated-company/properties/hs_analytics_last_visit_timestamp_timestamp_latest_value_999a0fce

