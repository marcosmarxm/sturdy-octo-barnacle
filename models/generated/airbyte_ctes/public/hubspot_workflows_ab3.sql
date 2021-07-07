{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('id'),
        adapter.quote('name'),
        adapter.quote('type'),
        boolean_to_string('enabled'),
        'updatedat',
        'insertedat',
        array_to_string('personatagids'),
        'contactlistids',
    ]) }} as _airbyte_hubspot_workflows_hashid
from {{ ref('hubspot_workflows_ab2') }}
-- hubspot_workflows

