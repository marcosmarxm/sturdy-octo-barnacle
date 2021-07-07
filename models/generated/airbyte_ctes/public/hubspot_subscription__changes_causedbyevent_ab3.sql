{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_changes_hashid',
        adapter.quote('id'),
        'created',
    ]) }} as _airbyte_causedbyevent_hashid
from {{ ref('hubspot_subscription__changes_causedbyevent_ab2') }}
-- causedbyevent at hubspot_subscription_changes/changes/causedByEvent

