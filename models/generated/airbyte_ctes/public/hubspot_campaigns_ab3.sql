{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('id'),
        adapter.quote('name'),
        adapter.quote('type'),
        'appid',
        'appname',
        'subtype',
        'subject',
        'counters',
        'contentid',
        'numqueued',
        'numincluded',
        'lastupdatedtime',
    ]) }} as _airbyte_hubspot_campaigns_hashid
from {{ ref('hubspot_campaigns_ab2') }}
-- hubspot_campaigns

