{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_properties_hashid,
    {{ json_extract_scalar('hs_ideal_customer_profile', ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar('hs_ideal_customer_profile', ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar('hs_ideal_customer_profile', ['sourceId']) }} as sourceid,
    {{ json_extract_scalar('hs_ideal_customer_profile', ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_ass__ed_company_properties') }}
where hs_ideal_customer_profile is not null
-- hs_ideal_customer_profile at hubspot_contacts/associated-company/properties/hs_ideal_customer_profile

