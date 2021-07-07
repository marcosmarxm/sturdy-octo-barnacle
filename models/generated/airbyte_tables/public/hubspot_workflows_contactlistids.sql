{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_workflows_hashid,
    steps,
    active,
    enrolled,
    _airbyte_emitted_at,
    _airbyte_contactlistids_hashid
from {{ ref('hubspot_workflows_contactlistids_ab3') }}
-- contactlistids at hubspot_workflows/contactListIds from {{ ref('hubspot_workflows') }}

