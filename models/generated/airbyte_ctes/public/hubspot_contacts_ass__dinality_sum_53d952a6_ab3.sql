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
    ]) }} as _airbyte_hs_analytic__y_sum_53d952a6_hashid
from {{ ref('hubspot_contacts_ass__dinality_sum_53d952a6_ab2') }}
-- hs_analytics_num_vis__dinality_sum_53d952a6 at hubspot_contacts/associated-company/properties/hs_analytics_num_visits_cardinality_sum_53d952a6

