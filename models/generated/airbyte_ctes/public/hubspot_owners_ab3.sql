{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('type'),
        'email',
        'ownerid',
        boolean_to_string('isactive'),
        'lastname',
        'portalid',
        'createdat',
        'firstname',
        'signature',
        'updatedat',
        array_to_string('remotelist'),
        'activeuserid',
        boolean_to_string('hascontactsaccess'),
        'useridincludinginactive',
    ]) }} as _airbyte_hubspot_owners_hashid
from {{ ref('hubspot_owners_ab2') }}
-- hubspot_owners

