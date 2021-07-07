{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('id'),
        adapter.quote('type'),
        boolean_to_string('active'),
        'ownerid',
        'metadata',
        'portalid',
        'createdat',
        adapter.quote('timestamp'),
        'properties',
        array_to_string('attachments'),
        'lastupdated',
        'associations',
    ]) }} as _airbyte_hubspot_engagements_hashid
from {{ ref('hubspot_engagements_ab2') }}
-- hubspot_engagements

