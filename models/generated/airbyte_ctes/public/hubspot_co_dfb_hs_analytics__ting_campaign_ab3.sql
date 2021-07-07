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
    ]) }} as _airbyte_hs_analytic__rting_campaign_hashid
from {{ ref('hubspot_co_dfb_hs_analytics__ting_campaign_ab2') }}
-- hs_analytics_first_t__h_converting_campaign at hubspot_contacts/associated-company/properties/hs_analytics_first_touch_converting_campaign

