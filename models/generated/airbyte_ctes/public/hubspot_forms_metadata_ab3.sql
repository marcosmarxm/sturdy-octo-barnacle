{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_forms_hashid',
        adapter.quote('name'),
        adapter.quote('value'),
    ]) }} as _airbyte_metadata_hashid
from {{ ref('hubspot_forms_metadata_ab2') }}
-- metadata at hubspot_forms/metaData

