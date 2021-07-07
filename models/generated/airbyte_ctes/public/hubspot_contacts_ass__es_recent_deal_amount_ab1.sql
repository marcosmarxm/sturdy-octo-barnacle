{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('recent_deal_amount', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('recent_deal_amount', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('recent_deal_amount', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('recent_deal_amount', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where recent_deal_amount is not null
-- recent_deal_amount at hubspot_contacts/associated-company/properties/recent_deal_amount

