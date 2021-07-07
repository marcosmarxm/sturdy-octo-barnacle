{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('id') }},
    archived,
    contacts,
    companies,
    createdat,
    dealstage,
    updatedat,
    properties,
    _airbyte_emitted_at,
    _airbyte_hubspot_deals_hashid
from {{ ref('hubspot_deals_ab3') }}
-- hubspot_deals from {{ source('public', '_airbyte_raw_hubspot_deals') }}

