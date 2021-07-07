{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('num_conversion_event__dinality_sum_d095f14b', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('num_conversion_event__dinality_sum_d095f14b', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('num_conversion_event__dinality_sum_d095f14b', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('num_conversion_event__dinality_sum_d095f14b', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where num_conversion_event__dinality_sum_d095f14b is not null
-- num_conversion_event__dinality_sum_d095f14b at hubspot_contacts/associated-company/properties/num_conversion_events_cardinality_sum_d095f14b

