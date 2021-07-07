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
    ]) }} as _airbyte_hs_merged_object_ids_hashid
from {{ ref('hubspot_contacts_ass___hs_merged_object_ids_ab2') }}
-- hs_merged_object_ids at hubspot_contacts/associated-company/properties/hs_merged_object_ids

