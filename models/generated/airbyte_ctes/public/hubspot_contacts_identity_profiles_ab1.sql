{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_contacts', 'hubspot_contacts', adapter.quote('identity-profiles')) }}
select
    _airbyte_hubspot_contacts_hashid,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('identity-profiles')), ['vid']) }} as vid,
    {{ json_extract_array(unnested_column_value(adapter.quote('identity-profiles')), ['identities']) }} as identities,
    {{ json_extract_scalar(unnested_column_value(adapter.quote('identity-profiles')), ['saved-at-timestamp']) }} as {{ adapter.quote('saved-at-timestamp') }},
    {{ json_extract_scalar(unnested_column_value(adapter.quote('identity-profiles')), ['deleted-changed-timestamp']) }} as {{ adapter.quote('deleted-changed-timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts') }}
{{ cross_join_unnest('hubspot_contacts', adapter.quote('identity-profiles')) }}
where {{ adapter.quote('identity-profiles') }} is not null
-- identity_profiles at hubspot_contacts/identity-profiles

