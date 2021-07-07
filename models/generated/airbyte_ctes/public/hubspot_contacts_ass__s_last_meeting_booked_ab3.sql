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
    ]) }} as _airbyte_engagements__meeting_booked_hashid
from {{ ref('hubspot_contacts_ass__s_last_meeting_booked_ab2') }}
-- engagements_last_meeting_booked at hubspot_contacts/associated-company/properties/engagements_last_meeting_booked

