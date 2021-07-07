{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_engagements_hashid',
        array_to_string('dealids'),
        array_to_string('companyids'),
        array_to_string('contactids'),
    ]) }} as _airbyte_associations_hashid
from {{ ref('hubspot_engagements_associations_ab2') }}
-- associations at hubspot_engagements/associations

