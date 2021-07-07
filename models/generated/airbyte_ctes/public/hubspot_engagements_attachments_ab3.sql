{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_engagements_hashid',
        adapter.quote('id'),
    ]) }} as _airbyte_attachments_hashid
from {{ ref('hubspot_engagements_attachments_ab2') }}
-- attachments at hubspot_engagements/attachments

