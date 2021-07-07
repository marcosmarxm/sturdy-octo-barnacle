{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        array_to_string('contacts'),
        'portalid',
        'companyid',
        'createdat',
        boolean_to_string('isdeleted'),
        'updatedat',
        'properties',
        array_to_string('mergeaudits'),
        array_to_string('statechanges'),
        array_to_string('additionaldomains'),
    ]) }} as _airbyte_hubspot_companies_hashid
from {{ ref('hubspot_companies_ab2') }}
-- hubspot_companies

