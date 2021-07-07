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
    ]) }} as _airbyte_about_us_hashid
from {{ ref('hubspot_contacts_ass__y_properties_about_us_ab2') }}
-- about_us at hubspot_contacts/associated-company/properties/about_us

