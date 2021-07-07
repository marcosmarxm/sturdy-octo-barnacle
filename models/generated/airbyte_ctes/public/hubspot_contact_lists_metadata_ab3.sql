{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_contact_lists_hashid',
        adapter.quote('size'),
        adapter.quote('error'),
        'processing',
        'lastsizechangeat',
        'lastprocessingstatechangeat',
    ]) }} as _airbyte_metadata_hashid
from {{ ref('hubspot_contact_lists_metadata_ab2') }}
-- metadata at hubspot_contact_lists/metaData

