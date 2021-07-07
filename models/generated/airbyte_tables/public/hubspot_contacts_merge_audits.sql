{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_contacts_hashid,
    {{ adapter.quote('user-id') }},
    {{ adapter.quote('timestamp') }},
    {{ adapter.quote('vid-to-merge') }},
    {{ adapter.quote('canonical-vid') }},
    merged_to_email,
    merged_from_email,
    {{ adapter.quote('num-properties-moved') }},
    _airbyte_emitted_at,
    _airbyte_merge_audits_hashid
from {{ ref('hubspot_contacts_merge_audits_ab3') }}
-- merge_audits at hubspot_contacts/merge-audits from {{ ref('hubspot_contacts') }}

