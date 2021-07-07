{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_deal_pipelines_hashid',
        adapter.quote('label'),
        boolean_to_string('active'),
        'stageid',
        'metadata',
        'createdat',
        'updatedat',
        'displayorder',
    ]) }} as _airbyte_stages_hashid
from {{ ref('hubspot_deal_pipelines_stages_ab2') }}
-- stages at hubspot_deal_pipelines/stages

