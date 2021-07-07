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
    ]) }} as _airbyte_hs_predicti__x_max_d4e58c1e_hashid
from {{ ref('hubspot_contacts_ass__next_max_max_d4e58c1e_ab2') }}
-- hs_predictivecontact__next_max_max_d4e58c1e at hubspot_contacts/associated-company/properties/hs_predictivecontactscore_v2_next_max_max_d4e58c1e

