{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_contacts', 'hubspot_contacts', adapter.quote('list-memberships')) }}
select
    _airbyte_hubspot_contacts_hashid,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('list-memberships')), ['vid']) }} as vid,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('list-memberships')), ['is-member']) }} as {{ adapter.quote('is-member') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('list-memberships')), ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('list-memberships')), ['static-list-id']) }} as {{ adapter.quote('static-list-id') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('list-memberships')), ['internal-list-id']) }} as {{ adapter.quote('internal-list-id') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts') }}
{{ cross_join_unnest('hubspot_contacts', adapter.quote('list-memberships')) }}
where {{ adapter.quote('list-memberships') }} is not null
-- list_memberships at hubspot_contacts/list-memberships

