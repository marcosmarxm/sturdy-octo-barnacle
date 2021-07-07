{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_stages_hashid',
        'isclosed',
        'probability',
    ]) }} as _airbyte_metadata_hashid
from {{ ref('hubspot_deal_pipelines_stages_metadata_ab2') }}
-- metadata at hubspot_deal_pipelines/stages/metadata

