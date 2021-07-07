{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('id'),
        boolean_to_string('archived'),
        array_to_string('contacts'),
        array_to_string('companies'),
        'createdat',
        'dealstage',
        'updatedat',
        'properties',
    ]) }} as _airbyte_hubspot_deals_hashid
from {{ ref('hubspot_deals_ab2') }}
-- hubspot_deals

