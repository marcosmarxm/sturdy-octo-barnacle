{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_contacts_hashid',
        'title',
        adapter.quote('form-id'),
        adapter.quote('page-url'),
        adapter.quote('portal-id'),
        adapter.quote('timestamp'),
        adapter.quote('conversion-id'),
    ]) }} as _airbyte_form_submissions_hashid
from {{ ref('hubspot_contacts_form_submissions_ab2') }}
-- form_submissions at hubspot_contacts/form-submissions

