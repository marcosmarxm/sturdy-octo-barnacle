{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        array_to_string('changes'),
        'portalid',
        'recipient',
        adapter.quote('timestamp'),
    ]) }} as _airbyte_hubspot_sub__iption_changes_hashid
from {{ ref('hubspot_subscription_changes_ab2') }}
-- hubspot_subscription_changes

