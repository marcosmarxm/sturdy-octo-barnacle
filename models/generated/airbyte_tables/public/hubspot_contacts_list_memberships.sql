{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_contacts_hashid,
    vid,
    {{ adapter.quote('is-member') }},
    {{ adapter.quote('timestamp') }},
    {{ adapter.quote('static-list-id') }},
    {{ adapter.quote('internal-list-id') }},
    _airbyte_emitted_at,
    _airbyte_list_memberships_hashid
from {{ ref('hubspot_contacts_list_memberships_ab3') }}
-- list_memberships at hubspot_contacts/list-memberships from {{ ref('hubspot_contacts') }}

