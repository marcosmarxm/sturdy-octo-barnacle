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
    ]) }} as _airbyte_hs_analytics_num_page_views_hashid
from {{ ref('hubspot_contacts_ass__lytics_num_page_views_ab2') }}
-- hs_analytics_num_page_views at hubspot_contacts/associated-company/properties/hs_analytics_num_page_views

