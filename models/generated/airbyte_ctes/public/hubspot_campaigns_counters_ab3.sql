{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_campaigns_hashid',
        adapter.quote('open'),
        'sent',
        'click',
        'print',
        'reply',
        'bounce',
        'dropped',
        adapter.quote('forward'),
        adapter.quote('deferred'),
        'delivered',
        'processed',
        'spamreport',
        'suppressed',
        'mta_dropped',
        'statuschange',
        'unsubscribed',
    ]) }} as _airbyte_counters_hashid
from {{ ref('hubspot_campaigns_counters_ab2') }}
-- counters at hubspot_campaigns/counters

