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
    ]) }} as _airbyte_first_conve__value_61f58f2c_hashid
from {{ ref('hubspot_contacts_ass__rliest_value_61f58f2c_ab2') }}
-- first_conversion_dat__rliest_value_61f58f2c at hubspot_contacts/associated-company/properties/first_conversion_date_timestamp_earliest_value_61f58f2c

