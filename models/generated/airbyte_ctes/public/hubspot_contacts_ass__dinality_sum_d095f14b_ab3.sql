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
    ]) }} as _airbyte_num_convers__y_sum_d095f14b_hashid
from {{ ref('hubspot_contacts_ass__dinality_sum_d095f14b_ab2') }}
-- num_conversion_event__dinality_sum_d095f14b at hubspot_contacts/associated-company/properties/num_conversion_events_cardinality_sum_d095f14b

