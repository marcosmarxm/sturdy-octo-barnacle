{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        'objectid',
        'portalid',
        'createdat',
        boolean_to_string('isdeleted'),
        'updatedat',
        'objecttype',
        'properties',
    ]) }} as _airbyte_hubspot_line_items_hashid
from {{ ref('hubspot_line_items_ab2') }}
-- hubspot_line_items

