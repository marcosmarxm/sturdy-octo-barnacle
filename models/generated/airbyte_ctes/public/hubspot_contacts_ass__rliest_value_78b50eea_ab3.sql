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
    ]) }} as _airbyte_first_conta__value_78b50eea_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_78b50eea_ab2') }}
-- first_contact_create__rliest_value_78b50eea at hubspot_contacts/associated-company/properties/first_contact_createdate_timestamp_earliest_value_78b50eea

