{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    contacts,
    portalid,
    companyid,
    createdat,
    isdeleted,
    updatedat,
    properties,
    mergeaudits,
    statechanges,
    additionaldomains,
    _airbyte_emitted_at,
    _airbyte_hubspot_companies_hashid
from {{ ref('hubspot_companies_ab3') }}
-- hubspot_companies from {{ source('public', '_airbyte_raw_hubspot_companies') }}

