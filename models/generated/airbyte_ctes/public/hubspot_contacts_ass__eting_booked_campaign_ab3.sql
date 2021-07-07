{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_properties_hashid',
        adapter.quote('value'),
        adapter.quote('source'),
        'sourceid',
        adapter.quote('timestamp'),
    ]) }} as _airbyte_engagements__ooked_campaign_hashid
from {{ ref('hubspot_contacts_ass__eting_booked_campaign_ab2') }}
-- engagements_last_meeting_booked_campaign at hubspot_contacts/associated-company/properties/engagements_last_meeting_booked_campaign

