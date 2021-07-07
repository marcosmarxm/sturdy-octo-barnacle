{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_owners_hashid',
        adapter.quote('id'),
        boolean_to_string('active'),
        'ownerid',
        'portalid',
        'remoteid',
        'remotetype',
    ]) }} as _airbyte_remotelist_hashid
from {{ ref('hubspot_owners_remotelist_ab2') }}
-- remotelist at hubspot_owners/remoteList

