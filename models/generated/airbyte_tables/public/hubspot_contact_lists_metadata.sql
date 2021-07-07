{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_contact_lists_hashid,
    {{ adapter.quote('size') }},
    {{ adapter.quote('error') }},
    processing,
    lastsizechangeat,
    lastprocessingstatechangeat,
    _airbyte_emitted_at,
    _airbyte_metadata_hashid
from {{ ref('hubspot_contact_lists_metadata_ab3') }}
-- metadata at hubspot_contact_lists/metaData from {{ ref('hubspot_contact_lists') }}

