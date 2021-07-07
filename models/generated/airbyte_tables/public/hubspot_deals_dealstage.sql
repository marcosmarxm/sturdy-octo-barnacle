{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_deals_hashid,
    {{ adapter.quote('value') }},
    versions,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_dealstage_hashid
from {{ ref('hubspot_deals_dealstage_ab3') }}
-- dealstage at hubspot_deals/dealstage from {{ ref('hubspot_deals') }}

