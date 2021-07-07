{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('id'),
        boolean_to_string('archived'),
        'createdat',
        'updatedat',
        'archivedat',
        'properties',
        'associations',
    ]) }} as _airbyte_hubspot_quotes_hashid
from {{ ref('hubspot_quotes_ab2') }}
-- hubspot_quotes

