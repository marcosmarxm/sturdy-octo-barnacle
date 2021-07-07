{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_metadata_hashid',
        'email',
    ]) }} as _airbyte_bcc_hashid
from {{ ref('hubspot_engagements_metadata_bcc_ab2') }}
-- bcc at hubspot_engagements/metadata/bcc

