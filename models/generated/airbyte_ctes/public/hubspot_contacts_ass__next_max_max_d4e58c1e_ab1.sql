{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('hs_predictivecontact__next_max_max_d4e58c1e', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('hs_predictivecontact__next_max_max_d4e58c1e', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('hs_predictivecontact__next_max_max_d4e58c1e', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('hs_predictivecontact__next_max_max_d4e58c1e', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where hs_predictivecontact__next_max_max_d4e58c1e is not null
-- hs_predictivecontact__next_max_max_d4e58c1e at hubspot_contacts/associated-company/properties/hs_predictivecontactscore_v2_next_max_max_d4e58c1e

