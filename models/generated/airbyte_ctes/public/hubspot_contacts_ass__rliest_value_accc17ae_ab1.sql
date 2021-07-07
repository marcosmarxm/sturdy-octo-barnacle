{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('hs_analytics_first_v__rliest_value_accc17ae', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('hs_analytics_first_v__rliest_value_accc17ae', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('hs_analytics_first_v__rliest_value_accc17ae', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('hs_analytics_first_v__rliest_value_accc17ae', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where hs_analytics_first_v__rliest_value_accc17ae is not null
-- hs_analytics_first_v__rliest_value_accc17ae at hubspot_contacts/associated-company/properties/hs_analytics_first_visit_timestamp_timestamp_earliest_value_accc17ae

