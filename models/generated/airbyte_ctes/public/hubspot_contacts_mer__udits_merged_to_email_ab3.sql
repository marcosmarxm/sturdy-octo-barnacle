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
        adapter.quote('source-label'),
    ]) }} as _airbyte_merged_to_email_hashid
from {{ ref('hubspot_contacts_mer__udits_merged_to_email_ab2') }}
-- merged_to_email at hubspot_contacts/merge-audits/merged_to_email

