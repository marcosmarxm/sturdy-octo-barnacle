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
    ]) }} as _airbyte_recent_deal_amount_hashid
from {{ ref('hubspot_contacts_ass__es_recent_deal_amount_ab2') }}
-- recent_deal_amount at hubspot_contacts/associated-company/properties/recent_deal_amount

