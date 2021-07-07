{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_sub__iption_changes_hashid',
        'change',
        adapter.quote('source'),
        'portalid',
        adapter.quote('timestamp'),
        'changetype',
        'causedbyevent',
        'subscriptionid',
    ]) }} as _airbyte_changes_hashid
from {{ ref('hubspot_subscription_changes_changes_ab2') }}
-- changes at hubspot_subscription_changes/changes

