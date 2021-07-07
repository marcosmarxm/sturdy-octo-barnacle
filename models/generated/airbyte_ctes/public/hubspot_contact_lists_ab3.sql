{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('name'),
        'listid',
        boolean_to_string(adapter.quote('dynamic')),
        array_to_string('filters'),
        boolean_to_string('archived'),
        'listtype',
        'metadata',
        'parentid',
        'portalid',
        boolean_to_string('readonly'),
        'createdat',
        'updatedat',
        boolean_to_string('deleteable'),
        'internallistid',
    ]) }} as _airbyte_hubspot_contact_lists_hashid
from {{ ref('hubspot_contact_lists_ab2') }}
-- hubspot_contact_lists

