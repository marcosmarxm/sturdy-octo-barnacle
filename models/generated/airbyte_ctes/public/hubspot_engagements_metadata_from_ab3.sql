{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_metadata_hashid',
        'email',
        'lastname',
        'firstname',
    ]) }} as _airbyte_from_hashid
from {{ ref('hubspot_engagements_metadata_from_ab2') }}
-- from at hubspot_engagements/metadata/from

