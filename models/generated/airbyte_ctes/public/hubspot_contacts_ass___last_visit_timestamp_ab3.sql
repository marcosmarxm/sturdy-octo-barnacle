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
    ]) }} as _airbyte_hs_analytic__isit_timestamp_hashid
from {{ ref('hubspot_contacts_ass___last_visit_timestamp_ab2') }}
-- hs_analytics_last_visit_timestamp at hubspot_contacts/associated-company/properties/hs_analytics_last_visit_timestamp

