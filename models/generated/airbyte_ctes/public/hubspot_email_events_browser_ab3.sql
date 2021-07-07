{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_email_events_hashid',
        'url',
        adapter.quote('name'),
        adapter.quote('type'),
        adapter.quote('family'),
        'producer',
        'producerurl',
    ]) }} as _airbyte_browser_hashid
from {{ ref('hubspot_email_events_browser_ab2') }}
-- browser at hubspot_email_events/browser

