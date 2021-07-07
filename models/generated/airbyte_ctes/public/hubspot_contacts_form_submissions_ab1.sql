{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_contacts', 'hubspot_contacts', adapter.quote('form-submissions')) }}
select
    _airbyte_hubspot_contacts_hashid,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('form-submissions')), ['title']) }} as title,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('form-submissions')), ['form-id']) }} as {{ adapter.quote('form-id') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('form-submissions')), ['page-url']) }} as {{ adapter.quote('page-url') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('form-submissions')), ['portal-id']) }} as {{ adapter.quote('portal-id') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('form-submissions')), ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('form-submissions')), ['conversion-id']) }} as {{ adapter.quote('conversion-id') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts') }}
{{ cross_join_unnest('hubspot_contacts', adapter.quote('form-submissions')) }}
where {{ adapter.quote('form-submissions') }} is not null
-- form_submissions at hubspot_contacts/form-submissions

