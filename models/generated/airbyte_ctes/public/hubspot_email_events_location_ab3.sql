{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_email_events_hashid',
        'city',
        adapter.quote('state'),
        'country',
    ]) }} as _airbyte_location_hashid
from {{ ref('hubspot_email_events_location_ab2') }}
-- location at hubspot_email_events/location

