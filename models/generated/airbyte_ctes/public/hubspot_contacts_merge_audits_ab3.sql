{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_contacts_hashid',
        adapter.quote('user-id'),
        adapter.quote('timestamp'),
        adapter.quote('vid-to-merge'),
        adapter.quote('canonical-vid'),
        'merged_to_email',
        'merged_from_email',
        adapter.quote('num-properties-moved'),
    ]) }} as _airbyte_merge_audits_hashid
from {{ ref('hubspot_contacts_merge_audits_ab2') }}
-- merge_audits at hubspot_contacts/merge-audits

