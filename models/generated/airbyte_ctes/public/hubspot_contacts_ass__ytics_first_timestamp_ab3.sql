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
    ]) }} as _airbyte_hs_analytic__irst_timestamp_hashid
from {{ ref('hubspot_contacts_ass__ytics_first_timestamp_ab2') }}
-- hs_analytics_first_timestamp at hubspot_contacts/associated-company/properties/hs_analytics_first_timestamp

