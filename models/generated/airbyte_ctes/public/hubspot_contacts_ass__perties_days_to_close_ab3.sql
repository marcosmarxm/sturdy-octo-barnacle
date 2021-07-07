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
    ]) }} as _airbyte_days_to_close_hashid
from {{ ref('hubspot_contacts_ass__perties_days_to_close_ab2') }}
-- days_to_close at hubspot_contacts/associated-company/properties/days_to_close

