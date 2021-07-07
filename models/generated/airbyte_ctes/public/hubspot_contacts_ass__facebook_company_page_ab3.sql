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
    ]) }} as _airbyte_facebook_company_page_hashid
from {{ ref('hubspot_contacts_ass__facebook_company_page_ab2') }}
-- facebook_company_page at hubspot_contacts/associated-company/properties/facebook_company_page

