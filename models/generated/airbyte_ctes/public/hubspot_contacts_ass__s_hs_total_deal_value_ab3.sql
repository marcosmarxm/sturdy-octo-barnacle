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
    ]) }} as _airbyte_hs_total_deal_value_hashid
from {{ ref('hubspot_contacts_ass__s_hs_total_deal_value_ab2') }}
-- hs_total_deal_value at hubspot_contacts/associated-company/properties/hs_total_deal_value

