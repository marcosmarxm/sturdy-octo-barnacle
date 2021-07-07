{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_forms_hashid,
    {{ adapter.quote('name') }},
    {{ adapter.quote('value') }},
    _airbyte_emitted_at,
    _airbyte_metadata_hashid
from {{ ref('hubspot_forms_metadata_ab3') }}
-- metadata at hubspot_forms/metaData from {{ ref('hubspot_forms') }}

