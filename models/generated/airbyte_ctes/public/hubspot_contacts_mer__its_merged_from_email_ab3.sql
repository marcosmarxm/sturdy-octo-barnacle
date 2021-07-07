{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_merge_audits_hashid',
        adapter.quote('value'),
        boolean_to_string('selected'),
        adapter.quote('source-id'),
        adapter.quote('timestamp'),
        adapter.quote('source-type'),
        array_to_string(adapter.quote('source-vids')),
        adapter.quote('source-label'),
    ]) }} as _airbyte_merged_from_email_hashid
from {{ ref('hubspot_contacts_mer__its_merged_from_email_ab2') }}
-- merged_from_email at hubspot_contacts/merge-audits/merged_from_email

