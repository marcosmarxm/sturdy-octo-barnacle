{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('hs_target_account_recommendation_state', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('hs_target_account_recommendation_state', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('hs_target_account_recommendation_state', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('hs_target_account_recommendation_state', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where hs_target_account_recommendation_state is not null
-- hs_target_account_recommendation_state at hubspot_contacts/associated-company/properties/hs_target_account_recommendation_state

