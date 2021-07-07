{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_contacts_hashid,
    {{ json_extract_scalar(adapter.quote('associated-company'), ['portal-id']) }} as {{ adapter.quote('portal-id') }},
    {{ json_extract_scalar(adapter.quote('associated-company'), ['company-id']) }} as {{ adapter.quote('company-id') }},
    {{ json_extract(adapter.quote('associated-company'), ['properties']) }} as properties,
    _airbyte_emitted_at
from {{ ref('hubspot_contacts') }}
where {{ adapter.quote('associated-company') }} is not null
-- associated_company at hubspot_contacts/associated-company

