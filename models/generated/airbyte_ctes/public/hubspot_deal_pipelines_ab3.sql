{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('label'),
        boolean_to_string('active'),
        array_to_string('stages'),
        boolean_to_string(adapter.quote('default')),
        'createdat',
        'updatedat',
        'objecttype',
        'pipelineid',
        'displayorder',
        'objecttypeid',
    ]) }} as _airbyte_hubspot_deal_pipelines_hashid
from {{ ref('hubspot_deal_pipelines_ab2') }}
-- hubspot_deal_pipelines

