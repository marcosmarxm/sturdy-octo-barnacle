{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_deals_hashid',
        adapter.quote('value'),
        array_to_string('versions'),
        adapter.quote('timestamp'),
    ]) }} as _airbyte_dealstage_hashid
from {{ ref('hubspot_deals_dealstage_ab2') }}
-- dealstage at hubspot_deals/dealstage

