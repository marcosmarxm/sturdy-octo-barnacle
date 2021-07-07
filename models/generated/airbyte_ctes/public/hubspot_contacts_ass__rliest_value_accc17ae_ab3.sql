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
    ]) }} as _airbyte_hs_analytic__value_accc17ae_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_accc17ae_ab2') }}
-- hs_analytics_first_v__rliest_value_accc17ae at hubspot_contacts/associated-company/properties/hs_analytics_first_visit_timestamp_timestamp_earliest_value_accc17ae

