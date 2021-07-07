{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_contact_lists_hashid,
    {{ adapter.quote('type') }},
    {{ adapter.quote('value') }},
    {{ adapter.quote('operator') }},
    property,
    filterfamily,
    withintimemode,
    checkpastversions,
    _airbyte_emitted_at,
    _airbyte_filters_hashid
from {{ ref('hubspot_contact_lists_filters_ab3') }}
-- filters at hubspot_contact_lists/filters from {{ ref('hubspot_contact_lists') }}

