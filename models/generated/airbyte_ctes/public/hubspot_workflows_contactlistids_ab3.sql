{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_workflows_hashid',
        array_to_string('steps'),
        'active',
        'enrolled',
    ]) }} as _airbyte_contactlistids_hashid
from {{ ref('hubspot_workflows_contactlistids_ab2') }}
-- contactlistids at hubspot_workflows/contactListIds

