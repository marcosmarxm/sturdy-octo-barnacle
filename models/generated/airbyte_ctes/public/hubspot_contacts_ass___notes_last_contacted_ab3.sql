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
    ]) }} as _airbyte_notes_last_contacted_hashid
from {{ ref('hubspot_contacts_ass___notes_last_contacted_ab2') }}
-- notes_last_contacted at hubspot_contacts/associated-company/properties/notes_last_contacted

