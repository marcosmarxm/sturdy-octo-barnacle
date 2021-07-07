{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_deals_hashid,
    {{ json_extract_scalar('dealstage', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_array('dealstage', ['versions']) }} as versions,
    {{ json_extract_scalar('dealstage', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_deals') }}
where dealstage is not null
-- dealstage at hubspot_deals/dealstage

