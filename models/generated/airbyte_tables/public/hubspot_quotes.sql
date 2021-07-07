{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('id') }},
    archived,
    createdat,
    updatedat,
    archivedat,
    properties,
    associations,
    _airbyte_emitted_at,
    _airbyte_hubspot_quotes_hashid
from {{ ref('hubspot_quotes_ab3') }}
-- hubspot_quotes from {{ source('public', '_airbyte_raw_hubspot_quotes') }}

