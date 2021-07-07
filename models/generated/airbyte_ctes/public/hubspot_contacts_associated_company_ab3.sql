{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_contacts_hashid',
        adapter.quote('portal-id'),
        adapter.quote('company-id'),
        'properties',
    ]) }} as _airbyte_associated_company_hashid
from {{ ref('hubspot_contacts_associated_company_ab2') }}
-- associated_company at hubspot_contacts/associated-company

