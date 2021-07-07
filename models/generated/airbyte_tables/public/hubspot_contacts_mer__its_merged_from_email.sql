{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_merge_audits_hashid,
    {{ adapter.quote('value') }},
    selected,
    {{ adapter.quote('source-id') }},
    {{ adapter.quote('timestamp') }},
    {{ adapter.quote('source-type') }},
    {{ adapter.quote('source-vids') }},
    {{ adapter.quote('source-label') }},
    _airbyte_emitted_at,
    _airbyte_merged_from_email_hashid
from {{ ref('hubspot_contacts_mer__its_merged_from_email_ab3') }}
-- merged_from_email at hubspot_contacts/merge-audits/merged_from_email from {{ ref('hubspot_contacts_merge_audits') }}

