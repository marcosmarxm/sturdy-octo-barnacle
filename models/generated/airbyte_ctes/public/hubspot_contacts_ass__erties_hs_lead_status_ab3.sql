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
    ]) }} as _airbyte_hs_lead_status_hashid
from {{ ref('hubspot_contacts_ass__erties_hs_lead_status_ab2') }}
-- hs_lead_status at hubspot_contacts/associated-company/properties/hs_lead_status

