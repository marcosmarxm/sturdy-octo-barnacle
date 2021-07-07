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
    ]) }} as _airbyte_hs_parent_company_id_hashid
from {{ ref('hubspot_contacts_ass___hs_parent_company_id_ab2') }}
-- hs_parent_company_id at hubspot_contacts/associated-company/properties/hs_parent_company_id

