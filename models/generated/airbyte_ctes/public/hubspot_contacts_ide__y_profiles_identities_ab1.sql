{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_contacts_identity_profiles', 'identity_profiles', 'identities') }}
select
    _airbyte_identity_profiles_hashid,
    {{ json_extract_scalar(unnested_column_value('identities'), ['type']) }} as {{ adapter.quote('type') }},
    {{ json_extract_scalar(unnested_column_value('identities'), ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract_scalar(unnested_column_value('identities'), ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_identity_profiles') }}
{{ cross_join_unnest('identity_profiles', 'identities') }}
where identities is not null
-- identities at hubspot_contacts/identity-profiles/identities

