{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_num_convers__y_sum_d095f14b_hashid
from {{ ref('hubspot_contacts_ass__dinality_sum_d095f14b_ab3') }}
-- num_conversion_event__dinality_sum_d095f14b at hubspot_contacts/associated-company/properties/num_conversion_events_cardinality_sum_d095f14b from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

