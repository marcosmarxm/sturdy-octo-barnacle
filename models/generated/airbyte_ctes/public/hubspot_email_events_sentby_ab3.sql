{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_email_events_hashid',
        adapter.quote('id'),
        'created',
    ]) }} as _airbyte_sentby_hashid
from {{ ref('hubspot_email_events_sentby_ab2') }}
-- sentby at hubspot_email_events/sentBy

