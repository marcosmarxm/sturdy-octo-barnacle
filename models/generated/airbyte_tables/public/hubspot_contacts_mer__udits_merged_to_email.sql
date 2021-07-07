{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_merge_audits_hashid,
    {{ adapter.quote('value') }},
    selected,
    {{ adapter.quote('source-id') }},
    {{ adapter.quote('timestamp') }},
    {{ adapter.quote('source-type') }},
    {{ adapter.quote('source-label') }},
    _airbyte_emitted_at,
    _airbyte_merged_to_email_hashid
from {{ ref('hubspot_contacts_mer__udits_merged_to_email_ab3') }}
-- merged_to_email at hubspot_contacts/merge-audits/merged_to_email from {{ ref('hubspot_contacts_merge_audits') }}

